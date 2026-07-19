# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'eac_users_support/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'eac_users_support'
  s.version     = EacUsersSupport::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'Ready-to-use support for users registration, login, logout, etc, for Rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.required_ruby_version = '>= 2.7'

  s.add_dependency 'devise', '~> 4.9', '>= 4.9.4'
  s.add_dependency 'devise_invitable', '~> 2.0', '>= 2.0.12'
  s.add_dependency 'eac_active_scaffold', '~> 0.8', '>= 0.8.1'
  s.add_dependency 'eac_rails_utils', '~> 0.29'
  s.add_dependency 'eac_ruby_utils', '~> 0.131', '>= 0.131.2'
  s.add_dependency 'rails', '~> 6.1.7', '>= 6.1.7.10'
  s.add_dependency 'recordselect', '~> 3.10', '>= 3.10.9'

  s.add_development_dependency 'eac_rails_gem_support', '~> 0.12', '>= 0.12.2'
end
