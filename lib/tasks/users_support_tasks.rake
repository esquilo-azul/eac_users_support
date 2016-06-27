namespace :users do
  desc <<eos
Reseta a senha do usuário e permite setá-lo como administrador.

Exemplos:

  # Reseta a senha do usuário "fulano@example.com" para "fulano@example.com".
  bin/rake password_reset[fulano@example.com,false]

  # Reseta a senha do usuário "fulano@example.com" para "fulano@example.com"
  # e seta-o como administrador.
  bin/rake password_reset[fulano@example.com,true]
eos
  task :password_reset, [:email] => :environment do |_t, args|
    UsersSupport::Tasks::PasswordReset.new(args.email).run
  end
end
