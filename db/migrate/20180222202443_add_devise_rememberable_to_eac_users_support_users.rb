# frozen_string_literal: true

class AddDeviseRememberableToEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    add_column :eac_users_support_users, :remember_created_at, :datetime
  end
end
