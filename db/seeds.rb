# alcohol_drinks = Store::Category.where(name: 'Напитки алкогольные').first_or_create!
# special_drinks = Store::Category.where(name: 'Специальное предложение', parent_id: alcohol_drinks.id).first_or_create!
# long_drinks = Store::Category.where(name: 'Лонги', parent_id: alcohol_drinks.id).first_or_create!
# short_drinks = Store::Category.where(name: 'Шоты', parent_id: alcohol_drinks.id).first_or_create!
# strong_drinks = Store::Category.where(name: 'Крепкий алкоголь', parent_id: alcohol_drinks.id).first_or_create!
# beer = Store::Category.where(name: 'Пиво', parent_id: alcohol_drinks.id).first_or_create!
#
# non_alcohol_drinks = Store::Category.where(name: 'Безалкогольные напитки').first_or_create!
# food = Store::Category.where(name: 'Еда').first_or_create!
# first_serve = Store::Category.where(name: 'Горячее', parent_id: food.id).first_or_create!
# snack = Store::Category.where(name: 'Закуски', parent_id: food.id).first_or_create!
# dessert = Store::Category.where(name: 'Десерты', parent_id: food.id).first_or_create!

def import_category(html, category_scope = Store::Category.all)
  recipes = []
  name = html.at_css('h1,h2,h3').try(:text)
  category = category_scope.where(name: name).first_or_create!
  child_categories = html.xpath('./div[@class="b-category"]')
  if child_categories.any?
    child_categories.each do |child_category|
      recipes += import_category(child_category, category.children)
    end
  else
    html.css('.b-items li').each do |recipe_html|
      attributes = {
        name: recipe_html.at_css('.b-name').text,
        price: recipe_html.at_css('.b-price').try(:text),
      }

      volume = recipe_html.at_css('.b-volume').try(:text)

      if volume.present? && volume =~ /([\d]+)мл/
        attributes[:amount] = $1.to_f / 1000
        attributes[:measure] = :liter
      end

      components = recipe_html.at_css('.b-contents').try(:text)
      constituents = []
      if components.present?
        components = components.split(/,\s*/)
        components.each do |component|
          constituent = Stock::Constituent.where(name: component).first_or_create!
          constituents << constituent
        end
      end

      recipe = category.recipes.where(
        attributes.slice(:name),
      ).first_or_initialize

      recipe.update_attributes(attributes)
      constituents.each do |constituent|
        component = recipe.components.where(constituent_id: constituent.id).first_or_initialize
        component.show_in_menu = true
        component.save
      end
      recipes << recipe
    end
  end
  recipes
end


# Import Bass:weight menu

menu = Store::Menu.where(name: 'Bass:weight Night @ 1|08|14 Moscow').first_or_create!
html = Nokogiri::HTML(open(Rails.root.join('db/seeds/menu.html')))
recipes = html.css('.b-page').xpath('./div[@class="b-category"]').inject([]) do |result, main_category_html|
  result + import_category(main_category_html)
end
menu.recipes += recipes

def import_component(recipe, row, ws)
  constituent_name = ws[row, 2]
  constituent_volume = ws[row, 3]

  if constituent_volume =~ /([\d]+)мл/
    constituent_amount = BigDecimal($1) / 1000
    constituent_measure = :liter
  elsif constituent_volume =~ /([\d]+)г/
    constituent_amount = BigDecimal($1)
    constituent_measure = :gram
  else
    constituent_amount = BigDecimal(constituent_volume)
  end

  constituent = Stock::Constituent.where(name: constituent_name).first_or_create!
  recipe.components.where(
    constituent_id: constituent.id
  ).first_or_initialize.update_attributes(
    amount: constituent_amount,
    measure: constituent_measure
  )
end

# Import Spreadsheet

if ENV['GOOGLE_CREDENTIALS']
  username, password = ENV['GOOGLE_CREDENTIALS'].split(':', 2)
  require 'google_drive'
  session = GoogleDrive.login(username, password)
  spreadsheet = session.spreadsheet_by_key('1RzmvovM3ymFE7lZ2JkULwT4y9NXB-lVw-NC9lJ2TiGc')
  ws = spreadsheet.worksheets[4]
  1.upto(ws.num_rows) do |row|
    if ws[row, 1].present? && ws[row, 2].present?
      recipe_name = ws[row, 1]
      recipe = Store::Recipe.where(name: recipe_name).first_or_create!
      recipe.show_recipe = true
      recipe.save!

      i = row
      while ws[i, 2].present?
        import_component(recipe, i, ws)
        i += 1
      end
    end
  end
end
