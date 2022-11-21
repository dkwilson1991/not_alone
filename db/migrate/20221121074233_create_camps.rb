class CreateCamps < ActiveRecord::Migration[7.0]
  def change
    create_table :camps do |t|
      t.string :address
      t.integer :required_number_volunteers
      t.date :start_date
      t.date :end_date
      t.string :description
      t.string :images
      t.string :director_email
      t.string :comments
      t.string :camp_name
      t.string :required_roles
      t.string :newsfeed_post
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
