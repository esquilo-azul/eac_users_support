# frozen_string_literal: true

require 'devise_invitable'
require_dependency 'eac_users_support'

module EacUsersSupport
  class User < ActiveRecord::Base
    devise :confirmable, :database_authenticatable, :invitable, :recoverable, :registerable,
           :rememberable

    validates :email, presence: true, uniqueness: true

    def current?
      self == self.class.current_user
    end

    def to_s
      email
    end
  end
end
