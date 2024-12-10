class AddCoordinatesToMusicians < ActiveRecord::Migration[7.1]
  def change
    add_column :musicians, :latitude, :float
    add_column :musicians, :longitude, :float
  end
end
