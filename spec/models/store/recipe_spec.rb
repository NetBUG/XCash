require 'rails_helper'

RSpec.describe Store::Recipe, type: :model do
  it { should belong_to(:category).class_name('Store::Category').inverse_of(:recipes) }
  it { should have_many(:components).class_name('Store::RecipeComponent').inverse_of(:recipe) }
  it { should have_many(:menu_items).class_name('Store::MenuItem').inverse_of(:recipe) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
end
