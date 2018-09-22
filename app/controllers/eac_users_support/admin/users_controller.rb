# frozen_string_literal: true

module EacUsersSupport
  module Admin
    class UsersController < ::EacUsersSupport::ApplicationController
      active_scaffold ::EacUsersSupport::User do |conf|
        conf.columns.exclude :encrypted_password
        %w[create update list].each do |action|
          conf.send(action).columns.exclude :remember_created_at
        end
      end

      protected

      def before_create_save(record)
        record.password = record.email
      end
    end
  end
end
