class Stock::ConstituentSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :measure
end
