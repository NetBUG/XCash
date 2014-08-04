# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_menu_item, :class => 'Store::MenuItem' do
    menu nil
    recipe nil
  end
end
