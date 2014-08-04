class Store::Recipe < ActiveRecord::Base
  belongs_to :category, class_name: 'Store::Category', inverse_of: :recipes

  validates :name, presence: true, uniqueness: {scope: :category_id}
end
