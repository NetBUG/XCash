class Store::RecipeComponentSerializer < ApplicationSerializer
  attributes :id, :amount, :measure
  has_one :recipe
  has_one :constituent
end
