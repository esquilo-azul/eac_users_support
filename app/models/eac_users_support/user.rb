# frozen_string_literal: true

require 'devise_invitable'
require_dependency 'eac_users_support'

module EacUsersSupport
  class User < ActiveRecord::Base
    devise :confirmable, :database_authenticatable, :invitable, :registerable, :rememberable

    validates :email, presence: true, uniqueness: true

    def to_s
      email
    end
  end
end
