class Store::Category < ActiveRecord::Base
  # TODO uncomment when awesome_nested_set will be fixed
  # acts_as_nested_set dependent: :nullify

  belongs_to :parent, class_name: 'Store::Category', inverse_of: :children
  has_many :children, class_name: 'Store::Category', inverse_of: :parent, dependent: :nullify

  has_many :recipes, class_name: 'Store::Recipe', inverse_of: :category, dependent: :nullify

  validates :name, presence: true, uniqueness: {scope: :parent_id}
end
