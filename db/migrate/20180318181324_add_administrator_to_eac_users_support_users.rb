# frozen_string_literal: true

class AddAdministratorToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    add_column :eac_users_support_users, :administrator, :boolean, null: false, default: false
  end
end
