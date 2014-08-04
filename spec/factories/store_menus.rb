# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_menu, :class => 'Store::Menu' do
    name "MyString"
  end
end
