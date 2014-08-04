class Store::OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :amount, :cost
  has_one :order
  has_one :recipe
end
