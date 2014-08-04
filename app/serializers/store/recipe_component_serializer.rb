class Store::RecipeComponentSerializer < ActiveModel::Serializer
  attributes :id, :amount, :measure
  has_one :recipe
  has_one :constituent
end
