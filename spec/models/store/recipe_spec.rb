require 'rails_helper'

RSpec.describe Store::Recipe, type: :model do
  it { should belong_to(:category).class_name('Store::Category').inverse_of(:recipes) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
end
