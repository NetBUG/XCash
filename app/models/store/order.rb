class Store::Order < ActiveRecord::Base
  validates :cost, presence: true, numericality: true
  validates :state, presence: true

  state_machine initial: :waiting_for do
    state :open
    state :processed
    state :completed
  end
end
