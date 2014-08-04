# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_order, :class => 'Store::Order' do
    cost "9.99"
  end
end
