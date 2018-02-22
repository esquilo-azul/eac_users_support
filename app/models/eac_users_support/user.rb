# frozen_string_literal: true
require_dependency 'eac_users_support'

module EacUsersSupport
  class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :rememberable

    validates :email, presence: true, uniqueness: true

    def to_s
      email
    end
  end
end
