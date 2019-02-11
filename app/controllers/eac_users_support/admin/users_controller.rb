# frozen_string_literal: true

module EacUsersSupport
  module Admin
    class UsersController < ::EacUsersSupport::ApplicationController
      active_scaffold ::EacUsersSupport::User do |conf|
        conf.action_links.add :password_reset,
                              type: :member, method: :put, position: false,
                              label: ::I18n.t(:'eac_users_support.password_reset.action')
        conf.columns.exclude :encrypted_password
        %w[create update list].each do |action|
          conf.send(action).columns.exclude :remember_created_at
        end
      end

      def password_reset
        process_action_link_action do |record|
          record.password = ::Devise.friendly_token
          if record.save
            flash[:info] = ::I18n.t(:'eac_users_support.password_reset.successful',
                                    user: record, password: record.password)
          else
            flash[:error] = ::I18n.t(:'eac_users_support.password_reset.failed', user: user) +
                            ': ' + record.errors.to_s
          end
        end
      end

      protected

      def before_create_save(record)
        record.password = record.email
      end
    end
  end
end
