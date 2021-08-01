# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacUsersSupport
  module Rspec
    class Setup
      common_constructor :setup_obj

      def perform
        setup_devise
      end

      private

      def setup_devise
        require 'devise'
        setup_obj.rspec_config.include Warden::Test::Helpers
        setup_obj.rspec_config.after(:each) { Warden.test_reset! }
      end
    end
  end
end
