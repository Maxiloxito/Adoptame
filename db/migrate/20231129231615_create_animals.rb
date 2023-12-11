class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :nombre
      t.string :raza
      t.integer :edad_age
      t.integer :edad_month
      t.string :color
      t.string :tipo_animal
      t.integer :id_organizacion
      t.string :descripcion
      t.string :comportamiento

      t.timestamps
    end
  end
end
