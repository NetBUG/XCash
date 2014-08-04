# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store_recipe_component, :class => 'Store::RecipeComponent' do
    recipe nil
    amount "9.99"
    measure "MyString"
    constituent nil
  end
end
