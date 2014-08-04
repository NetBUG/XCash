# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_recipe, :class => 'Store::Recipe' do
    name "MyString"
    category nil
    price "9.99"
    color "MyString"
    check_age false
    show_recipe false
  end
end
