class Store::Order < ActiveRecord::Base
  has_many :items, class_name: 'Store::OrderItem', inverse_of: :order
  has_many :recipes, through: :items

  validates :cost, presence: true, numericality: true
  validates :state, presence: true
  validates :items, length: {minimum: 1}

  state_machine initial: :waiting_for do
    state :open
    state :processed
    state :completed
  end

  private

end
