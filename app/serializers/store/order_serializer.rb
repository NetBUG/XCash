class Store::OrderSerializer < ActiveModel::Serializer
  attributes :id, :cost
end
