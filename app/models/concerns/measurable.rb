module Measurable
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    enumerize :measure, in: [:gram, :liter, :none], default: :none
  end
end
