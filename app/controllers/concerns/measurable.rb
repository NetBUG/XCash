module Measurable
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    enumerize :measure, in: %w(kg)
  end
end
