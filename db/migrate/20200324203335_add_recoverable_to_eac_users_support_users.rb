# frozen_string_literal: true

class AddRecoverableToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    change_table :eac_users_support_users do |t|
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
