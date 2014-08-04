require 'rails_helper'

RSpec.describe Store::MenuItem, type: :model do
  it { should belong_to(:menu).class_name('Store::Menu').inverse_of(:items) }
  it { should belong_to(:recipe).class_name('Store::Recipe').inverse_of(:menu_items) }
  it { should validate_presence_of(:menu) }
  it { should validate_presence_of(:recipe) }
end
