# frozen_string_literal: true

class AddUnconfirmedEmailToEacUsersSupportUsers < ActiveRecord::Migration
  def change
    add_column :eac_users_support_users, :unconfirmed_email, :string
  end
end
