class Store::CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :color, :check_age, :show_recipe, :lft, :rgt, :depth
  has_one :parent
end
