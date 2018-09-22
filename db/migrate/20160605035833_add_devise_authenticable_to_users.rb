# frozen_string_literal: true

class AddDeviseAuthenticableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string, null: false, default: ''
    add_index :users, :email, unique: true
  end
end
