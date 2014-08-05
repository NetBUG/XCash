require 'rails_helper'

RSpec.describe User, type: :model do
  it { should enumerize(:roles).in(:root, :bartender, :cook, :cashier, :steward) }
end
