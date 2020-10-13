# frozen_string_literal: true

class AddUnconfirmedEmailToEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    add_column :eac_users_support_users, :unconfirmed_email, :string
  end
end
