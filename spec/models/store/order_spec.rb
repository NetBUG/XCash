require 'rails_helper'

RSpec.describe Store::Order, type: :model do
  it { should validate_presence_of(:state) }
  it { should ensure_inclusion_of(:state).in_array([:waiting_for, :open, :processed, :completed]) }
  it { should validate_presence_of(:cost) }
  it { should validate_numericality_of(:cost) }
  it { should ensure_length_of(:items).is_at_least(1) }
end
