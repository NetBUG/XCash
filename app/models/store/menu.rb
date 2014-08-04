class Store::Menu < ActiveRecord::Base
  has_many :items, class_name: 'Store::MenuItem', inverse_of: :menu, dependent: :destroy
  has_many :recipes, through: :items
  validates :name, presence: true, uniqueness: true
end
