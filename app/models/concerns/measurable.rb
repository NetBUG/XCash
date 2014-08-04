module Measurable
  extend ActiveSupport::Concern

  included do
    extend Enumerize

    enumerize :measure, in: [:gram, :liter, :none], default: :none
  end

  def volume
    @volume ||= Store::Volume.new(self)
  end
end
