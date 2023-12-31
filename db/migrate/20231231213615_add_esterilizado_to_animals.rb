class AddEsterilizadoToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :esterilizado, :boolean
  end
end
