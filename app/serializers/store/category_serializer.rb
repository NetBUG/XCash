class Store::CategorySerializer < ApplicationSerializer
  attributes :id, :name, :color, :check_age, :show_recipe, :lft, :rgt, :depth
  has_one :parent, root: :categories
end
