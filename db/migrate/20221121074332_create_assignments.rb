class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.integer :final_volunteer_count
      t.string :roles
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :camp, null: false, foreign_key: true

      t.timestamps
    end
  end
end
