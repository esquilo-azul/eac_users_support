# frozen_string_literal: true

class AddDeviseAuthenticableToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    add_column :eac_users_support_users, :encrypted_password, :string, null: false, default: ''
    add_index :eac_users_support_users, :email, unique: true
  end
end
