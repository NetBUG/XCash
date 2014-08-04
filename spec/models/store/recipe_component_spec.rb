require 'rails_helper'

RSpec.describe Store::RecipeComponent, type: :model do
  it { should belong_to(:recipe).class_name('Store::Recipe').inverse_of(:components) }
  it { should belong_to(:constituent).class_name('Stock::Constituent').inverse_of(:recipe_components) }
  it { should validate_presence_of(:recipe) }
  it { should validate_presence_of(:constituent) }
  # TODO ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:  insert or update on table "store_recipe_components" violates foreign key constraint "fk_store_recipe_components_constituent_id"
  # it { should validate_uniqueness_of(:constituent_id).scoped_to(:recipe_id) }
end
