class Store::RecipeComponent < ActiveRecord::Base
  belongs_to :recipe, class_name: 'Store::Recipe', inverse_of: :components
  belongs_to :constituent, class_name: 'Stock::Constituent', inverse_of: :recipe_components

  validates :recipe, :constituent, presence: true
  validates :constituent_id, uniqueness: {scope: :recipe_id}
end
