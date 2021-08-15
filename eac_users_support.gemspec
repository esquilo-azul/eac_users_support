# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'eac_users_support/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'eac_users_support'
  s.version     = ::EacUsersSupport::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'Ready-to-use support for users registration, login, logout, etc, for Rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'active_scaffold', '>= 3.4.33'
  s.add_dependency 'devise', '~> 4.6', '>= 4.6.1'
  s.add_dependency 'devise_invitable', '~> 1.7', '>= 1.7.5'
  s.add_dependency 'eac_ruby_utils', '~> 0.74'
  s.add_dependency 'rails', '>= 4.2.11.3'
  s.add_dependency 'recordselect', '~> 3.10'

  s.add_development_dependency 'eac_rails_gem_support', '~> 0.2'
end
