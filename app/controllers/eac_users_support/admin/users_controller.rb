module EacUsersSupport
  module Admin
    class UsersController < ::EacUsersSupport::ApplicationController
      active_scaffold ::EacUsersSupport::User do |conf|
        conf.columns.exclude :encrypted_password
      end

      protected

      def before_create_save(record)
        record.password = record.email
      end
    end
  end
end
