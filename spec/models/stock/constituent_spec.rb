require 'rails_helper'

RSpec.describe Stock::Constituent, type: :model do
  it { should have_many(:recipe_components).class_name('Store::RecipeComponent').inverse_of(:constituent) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
