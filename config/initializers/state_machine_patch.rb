require 'state_machine'

# TODO remove patch after updating state_machine gem
module StateMachine
  module Integrations
    module ActiveModel
      public :around_validation
    end

    module ActiveRecord
      public :around_save
    end
  end
end
