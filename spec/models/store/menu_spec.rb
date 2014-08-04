require 'rails_helper'

RSpec.describe Store::Menu, type: :model do
  it { should have_many(:items).class_name('Store::MenuItem').inverse_of(:menu) }
  it { should have_many(:recipes).class_name('Store::Recipe').through(:items) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
