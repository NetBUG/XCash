class Store::RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :color, :check_age, :show_recipe
  has_one :category
end
