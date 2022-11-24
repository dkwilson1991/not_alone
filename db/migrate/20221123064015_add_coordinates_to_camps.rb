class AddCoordinatesToCamps < ActiveRecord::Migration[7.0]
  def change
    add_column :camps, :latitude, :float
    add_column :camps, :longitude, :float
  end
end
