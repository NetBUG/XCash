require 'rails_helper'

RSpec.describe Store::OrderItem, type: :model do
  it {  should belong_to(:order).class_name('Store::Order').inverse_of(:items) }
  it {  should belong_to(:recipe).class_name('Store::Recipe').inverse_of(:order_items) }
  it {  should validate_presence_of(:order) }
  it {  should validate_presence_of(:recipe) }
  it {  should validate_presence_of(:amount) }
  it {  should validate_presence_of(:cost) }
end
