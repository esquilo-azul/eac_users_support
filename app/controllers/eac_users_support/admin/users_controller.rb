# frozen_string_literal: true

module EacUsersSupport
  module Admin
    class UsersController < ::EacUsersSupport::ApplicationController
      record_select per_page: 10,
                    search_on: %i[email],
                    order_by: 'email ASC',
                    model: ::EacUsersSupport::User,
                    full_text_search: true

      active_scaffold ::EacUsersSupport::User do |conf|
        conf.action_links.add :password_reset,
                              type: :member, method: :put, position: false,
                              label: ::I18n.t(:'eac_users_support.password_reset.action')
        conf.columns = %i[email administrator created_at confirmed_at]
        conf.columns.exclude :encrypted_password
        %w[create update].each do |action|
          conf.send(action).columns.exclude :remember_created_at
        end
        conf.list.columns = %i[email administrator created_at confirmed_at]
      end

      def password_reset
        process_action_link_action do |record|
          record.password = ::Devise.friendly_token
          if record.save
            flash[:info] = ::I18n.t(:'eac_users_support.password_reset.successful',
                                    user: record, password: record.password)
          else
            flash[:error] = ::I18n.t(:'eac_users_support.password_reset.failed', user: user) + # rubocop:disable Style/StringConcatenation
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
