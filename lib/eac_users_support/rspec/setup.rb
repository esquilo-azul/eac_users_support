# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacUsersSupport
  module Rspec
    module Setup
      def self.extended(obj)
        obj.setup_devise
      end

      def setup_devise
        require 'devise'
        rspec_config.include Warden::Test::Helpers
        rspec_config.after(:each) { Warden.test_reset! }
      end
    end
  end
end
