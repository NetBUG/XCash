class ApplicationSerializer < ActiveModel::Serializer
  attribute :id
  embed :ids, include: true
end
