class Store::Recipe < ActiveRecord::Base
  include Measurable

  belongs_to :category, class_name: 'Store::Category', inverse_of: :recipes
  has_many :components, class_name: 'Store::RecipeComponent', inverse_of: :recipe

  validates :name, presence: true, uniqueness: {scope: :category_id}
end
