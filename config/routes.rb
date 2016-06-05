UsersSupport::Engine.routes.draw do
  namespace(:admin) do
    resources(:users) { as_routes }
  end
end
