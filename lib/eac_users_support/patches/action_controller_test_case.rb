# frozen_string_literal: true

module ActionController
  class TestCase
    include ::Devise::Test::ControllerHelpers

    setup do
      sign_in ::EacUsersSupport::User.find_or_create_by!(email: 'admin@example.com')
    end
  end
end
