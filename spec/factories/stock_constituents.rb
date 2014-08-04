# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock_constituent, :class => 'Stock::Constituent' do
    name "MyString"
    amount "9.99"
    measure "MyString"
  end
end
