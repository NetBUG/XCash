class Stock::Constituent < ActiveRecord::Base
  include Measurable

  has_many :recipe_components, class_name: 'Store::RecipeComponent', inverse_of: :constituent

  validates :name, presence: true, uniqueness: true
end
