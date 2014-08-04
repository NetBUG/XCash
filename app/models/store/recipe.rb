class Store::Recipe < ActiveRecord::Base
  include Measurable

  belongs_to :category, class_name: 'Store::Category', inverse_of: :recipes
  has_many :menu_items, class_name: 'Store::MenuItem', inverse_of: :recipe, dependent: :destroy
  has_many :components, class_name: 'Store::RecipeComponent', inverse_of: :recipe, dependent: :destroy
  has_many :constituents, through: :components
  has_many :order_items, class_name: 'Store::OrderItem', inverse_of: :recipe


  has_many :shown_components, -> { Store::RecipeComponent.shown_in_menu }, class_name: 'Store::RecipeComponent', inverse_of: :recipe
  has_many :shown_constituents, through: :shown_components, source: :constituent

  validates :name, presence: true, uniqueness: {scope: :category_id}
end
