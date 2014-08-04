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
  name = html.at_css('h1,h2,h3').try(:text)
  category = category_scope.where(name: name).first_or_create!
  child_categories = html.xpath('./div[@class="b-category"]')
  if child_categories.any?
    child_categories.each do |child_category|
      import_category(child_category, category.children)
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
    end
  end
end

html = Nokogiri::HTML(open(Rails.root.join('db/seeds/menu.html')))
html.css('.b-page').xpath('./div[@class="b-category"]').each do |main_category_html|
  import_category(main_category_html)
end
