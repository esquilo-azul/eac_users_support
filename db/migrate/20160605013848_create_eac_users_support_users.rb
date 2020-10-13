# frozen_string_literal: true

class CreateEacUsersSupportUsers < (
    Rails.version < '5' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  )
  def change
    create_table :eac_users_support_users do |t|
      t.string :email, null: false, default: ''

      t.timestamps null: false
    end
  end
end
