# frozen_string_literal: true
class RenameUsersToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    rename_table :users, :eac_users_support_users
  end
end
