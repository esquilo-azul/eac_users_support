# frozen_string_literal: true

require 'eac_rails_utils/patches/application'

::Rails.application.root_menu.group(:admin).group(:eac_users_support, :eac_users_support)
  .within do |g|
  g.action(:admin_users).label(-> { ::EacUsersSupport::User.plural_name })
end
