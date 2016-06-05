module UsersSupport
  class User < ActiveRecord::Base
    self.table_name = 'users'

    validates :email, presence: true, uniqueness: true

    def to_s
      email
    end
  end
end
