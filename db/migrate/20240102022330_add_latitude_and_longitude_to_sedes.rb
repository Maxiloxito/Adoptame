class AddLatitudeAndLongitudeToSedes < ActiveRecord::Migration[7.0]
  def change
    add_column :sedes, :latitude, :float
    add_column :sedes, :longitude, :float
  end
end
