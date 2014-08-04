class Store::Menu < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
