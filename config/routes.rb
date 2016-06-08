UsersSupport::Engine.routes.draw do
  namespace(:admin) do
    resources(:users) { as_routes }
  end
  devise_for :users, class_name: 'UsersSupport::User', module: :devise, skip: [:registrations]
  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  get '/users/sign_up(.:format)', to: 'devise/sessions#new', as: 'new_user_registration'
end
