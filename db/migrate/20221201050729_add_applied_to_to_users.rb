class AddAppliedToToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :applied_to, :string
  end
end
