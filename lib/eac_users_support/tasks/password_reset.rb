# frozen_string_literal: true

module EacUsersSupport
  module Tasks
    class PasswordReset
      def initialize(email, administrator)
        @email = email
        @administrator = administrator
      end

      def run
        u = User.find_by(email: @email)
        if u
          Rails.logger.info "Usuário encontrado com o email \"#{@email}\""
          u.update!(attributes_to_update)
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
    end
  end
end
