# frozen_string_literal: true

class AddAdministratorToEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    add_column :eac_users_support_users, :administrator, :boolean, null: false, default: false
  end
end
