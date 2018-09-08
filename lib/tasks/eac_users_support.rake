# frozen_string_literal: true

namespace :eac_users_support do
  desc <<~DESCRIPTION
    Reseta a senha do usuário e permite setá-lo como administrador.

    Exemplos:

      # Reseta a senha do usuário "fulano@example.com" para "fulano@example.com".
      bin/rake eac_users_support:password_reset[fulano@example.com]

      # Reseta a senha do usuário "fulano@example.com" para "fulano@example.com"
      # e seta-o como administrador.
      bin/rake eac_users_support:password_reset[fulano@example.com,1]
  DESCRIPTION
  task :password_reset, %i[email administrator] => :environment do |_t, args|
    ::EacUsersSupport::Tasks::PasswordReset.new(args.email, args.administrator.present?).run
  end
end
