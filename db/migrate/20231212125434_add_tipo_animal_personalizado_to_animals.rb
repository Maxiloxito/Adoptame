class AddTipoAnimalPersonalizadoToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :tipo_animal_personalizado, :string
  end
end
