# frozen_string_literal: true

Rails.application.routes.draw do
  mount EacUsersSupport::Engine => '/eac_users_support'
end
