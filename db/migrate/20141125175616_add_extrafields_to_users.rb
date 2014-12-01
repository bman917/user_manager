class AddExtrafieldsToUsers < ActiveRecord::Migration
  def change
    add_column :user_manager_users, :username, :string
    add_column :user_manager_users, :role, :string
    add_column :user_manager_users, :status, :string, default: 'Active'
  end
end
