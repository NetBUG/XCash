class Store::OrderItem < ActiveRecord::Base
  belongs_to :order, class_name: 'Store::Order', inverse_of: :items
  belongs_to :recipe, class_name: 'Store::Recipe', inverse_of: :order_items

  before_validation :compute_cost
  validates :order, :recipe, :amount, :cost, presence: true

  private

  def compute_cost
    return unless recipe && amount.try(:>, 0)
    self.cost = amount * recipe.price
  end
end
