# frozen_string_literal: true

EacUsersSupport::Engine.routes.draw do
  namespace(:admin) do
    resources(:users) do
      as_routes
      record_select_routes
      member do
        put :password_reset
      end
    end
  end
  devise_for :users, class_name: 'EacUsersSupport::User', module: :devise, skip: [:registrations]
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  get '/users/sign_up(.:format)', to: 'devise/sessions#new', as: 'new_user_registration'
end
