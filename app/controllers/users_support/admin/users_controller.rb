module UsersSupport
  module Admin
    class UsersController < ::UsersSupport::ApplicationController
      active_scaffold UsersSupport::User do |conf|
        conf.columns.exclude :encrypted_password
      end

      protected

      def before_create_save(record)
        record.password = record.email
      end
    end
  end
end
