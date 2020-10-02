# frozen_string_literal: true

EacUsersSupport::Engine.routes.draw do
  concern :active_scaffold, ActiveScaffold::Routing::Basic.new(association: true)
  namespace(:admin) do
    resources(:users, concerns: :active_scaffold) do
      record_select_routes
      member do
        put :password_reset
      end
    end
  end
  devise_for :users, class_name: 'EacUsersSupport::User', module: :devise
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
end
