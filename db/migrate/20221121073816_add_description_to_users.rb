class AddDescriptionToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :birthday, :date
    add_column :users, :certifications, :string
    add_column :users, :training, :string
    add_column :users, :avatar_pic, :string
    add_column :users, :language, :string
    add_column :users, :past_roles, :string
    add_column :users, :admin_status, :boolean
  end
end
