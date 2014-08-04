class Store::RecipeSerializer < ApplicationSerializer
  attributes :id, :name, :price, :color, :check_age, :show_recipe
  has_one :category
end
