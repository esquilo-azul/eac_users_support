UsersSupport::Engine.routes.draw do
  namespace(:admin) do
    resources(:users) { as_routes }
  end
  devise_for :users, class_name: 'UsersSupport::User', module: :devise
end
