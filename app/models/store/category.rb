class Store::Category < ActiveRecord::Base
  # TODO uncomment when awesome_nested_set will be fixed
  # acts_as_nested_set dependent: :nullify

  with_options class_name: 'Store::Category', foreign_key: :parent_id do |tree|
    tree.belongs_to :parent, inverse_of: :children
    tree.has_many :children, inverse_of: :parent, dependent: :nullify
  end

  has_many :recipes, class_name: 'Store::Recipe', inverse_of: :category, dependent: :nullify

  validates :name, presence: true, uniqueness: {scope: :parent_id}
end
