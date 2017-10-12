# frozen_string_literal: true
require 'active_scaffold'
require 'users_support/engine'

module EacUsersSupport
  require_dependency 'users_support/tasks/password_reset'
end
