# frozen_string_literal: true
require 'active_scaffold'
require 'eac_users_support/engine'

module EacUsersSupport
  def self.table_name_prefix
    'eac_users_support_'
  end
  require_dependency 'eac_users_support/tasks/password_reset'
end
