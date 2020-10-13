# frozen_string_literal: true

class AddDeviseAuthenticableToEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    add_column :eac_users_support_users, :encrypted_password, :string, null: false, default: ''
    add_index :eac_users_support_users, :email, unique: true
  end
end
