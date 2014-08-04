# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_order_item, :class => 'Store::OrderItem' do
    order nil
    recipe nil
    amount 1
    cost "9.99"
  end
end
