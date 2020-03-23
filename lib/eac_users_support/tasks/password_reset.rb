# frozen_string_literal: true

require 'eac_ruby_utils/simple_cache'

module EacUsersSupport
  module Tasks
    class PasswordReset
      include ::EacRubyUtils::SimpleCache

      def initialize(email, administrator)
        @email = email
        @administrator = administrator
      end

      def run
        if found_user
          Rails.logger.info "Usuário encontrado com o email \"#{@email}\""
          found_user.update!(attributes_to_update)
        else
          Rails.logger.info "Usuário não encontrado com o email \"#{@email}\". Criando..."
          User.create!({ email: @email }.merge(attributes_to_update))
        end
        Rails.logger.info "Senha resetada para #{@email}"
      end

      private

      def attributes_to_update
        r = { password: @email, password_confirmation: @email }
        r[:administrator] = true if @administrator
        r
      end

      def found_user_uncached
        ::EacUsersSupport::User.find_by(email: @email)
      end
    end
  end
end
