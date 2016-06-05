module UsersSupport
  module Admin
    class UsersController < ::UsersSupport::ApplicationController
      active_scaffold UsersSupport::User do |conf|
      end
    end
  end
end
