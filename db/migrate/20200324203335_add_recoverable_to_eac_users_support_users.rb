# frozen_string_literal: true

class AddRecoverableToEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    change_table :eac_users_support_users do |t|
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
  end
end
