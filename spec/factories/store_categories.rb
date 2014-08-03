# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_category, :class => 'Store::Category' do
    name "MyString"
    color "MyString"
    check_age false
    show_recipe false
    parent nil
    lft 1
    rgt 1
    depth 1
  end
end
