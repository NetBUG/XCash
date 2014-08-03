require 'rails_helper'

RSpec.describe Store::Category, type: :model do
  it { should belong_to(:parent).inverse_of(:children) }
  it { should have_many(:children).inverse_of(:parent) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:parent_id) }
end
