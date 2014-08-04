class Stock::Constituent < ActiveRecord::Base
  include Measurable

  validates :name, presence: true, uniqueness: true
end
