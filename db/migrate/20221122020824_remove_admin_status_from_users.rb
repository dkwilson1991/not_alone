class RemoveAdminStatusFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin_status, :boolean
    add_column :users, :admin_status, :boolean, default: false
  end
end
