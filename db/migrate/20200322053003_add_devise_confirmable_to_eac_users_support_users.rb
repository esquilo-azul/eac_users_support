# frozen_string_literal: true

class AddDeviseConfirmableToEacUsersSupportUsers < ActiveRecord::Migration
  class Model < ::ActiveRecord::Base
    self.table_name = :eac_users_support_users
  end

  def change
    add_column :eac_users_support_users, :confirmation_token, :string
    add_column :eac_users_support_users, :confirmed_at, :datetime
    add_column :eac_users_support_users, :confirmation_sent_at, :datetime
    # add_column :eac_users_support_users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :eac_users_support_users, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    reversible do |dir|
      dir.up { Model.update_all confirmed_at: DateTime.now }
    end
  end
end
