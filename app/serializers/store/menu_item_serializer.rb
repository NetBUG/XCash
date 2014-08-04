class Store::MenuItemSerializer < ApplicationSerializer
  attributes :id
  has_one :menu
  has_one :recipe
end
