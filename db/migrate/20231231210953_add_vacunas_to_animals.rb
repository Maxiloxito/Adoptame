class AddVacunasToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :vacunas, :string
  end
end
