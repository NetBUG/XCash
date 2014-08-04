class Store::MenuItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :menu
  has_one :recipe
end
