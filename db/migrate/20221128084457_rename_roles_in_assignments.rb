class RenameRolesInAssignments < ActiveRecord::Migration[7.0]
  def change
    rename_column :assignments, :roles, :role
  end
end
