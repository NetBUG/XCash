require 'awesome_nested_set'
require 'awesome_nested_set/model'
module CollectiveIdea
  module Acts
    module NestedSet
      module Model
        def reload_target(target, position)
          if target.is_a? self.class.base_class
            target.reload
          elsif position != :root
            nested_set_scope.where(primary_column_name => target).first
          end
        end
      end
    end
  end
end

alcohol_drinks = Store::Category.where(name: 'Напитки алкогольные').first_or_create!
special_drinks = Store::Category.where(name: 'Специальное предложение', parent_id: alcohol_drinks.id).first_or_create!
long_drinks = Store::Category.where(name: 'Лонги', parent_id: alcohol_drinks.id).first_or_create!
short_drinks = Store::Category.where(name: 'Шоты', parent_id: alcohol_drinks.id).first_or_create!
strong_drinks = Store::Category.where(name: 'Крепкий алкоголь', parent_id: alcohol_drinks.id).first_or_create!
beer = Store::Category.where(name: 'Пиво', parent_id: alcohol_drinks.id).first_or_create!

non_alcohol_drinks = Store::Category.where(name: 'Безалкогольные напитки').first_or_create!
food = Store::Category.where(name: 'Еда').first_or_create!
first_serve = Store::Category.where(name: 'Горячее', parent_id: food.id).first_or_create!
snack = Store::Category.where(name: 'Закуски', parent_id: food.id).first_or_create!
dessert = Store::Category.where(name: 'Десерты', parent_id: food.id).first_or_create!
