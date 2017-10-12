module EacUsersSupport
  module Tasks
    class PasswordReset
      def initialize(email)
        @email = email
      end

      def run
        u = User.find_by_email(@email)
        if u
          Rails.logger.info "Usuário encontrado com o email \"#{@email}\""
          u.update_attributes!(update_attributes)
        else
          Rails.logger.info "Usuário não encontrado com o email \"#{@email}\". Criando..."
          User.create!({ email: @email }.merge(update_attributes))
        end
        Rails.logger.info "Senha resetada para #{@email}"
      end

      private

      def update_attributes
        { password: @email, password_confirmation: @email }
      end
    end
  end
end
