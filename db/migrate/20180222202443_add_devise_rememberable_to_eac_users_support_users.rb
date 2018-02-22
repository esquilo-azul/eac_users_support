# frozen_string_literal: true
class AddDeviseRememberableToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    add_column :eac_users_support_users, :remember_created_at, :datetime
  end
end
