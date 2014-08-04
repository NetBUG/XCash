class Store::MenuItem < ActiveRecord::Base
  belongs_to :menu, class_name: 'Store::Menu', inverse_of: :items
  belongs_to :recipe, class_name: 'Store::Recipe', inverse_of: :menu_items

  validates :menu, :recipe, presence: true
end
