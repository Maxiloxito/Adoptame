class CreateAdopcions < ActiveRecord::Migration[7.0]
  def change
    create_table :adopcions do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true
      t.datetime :fecha
      t.string :estado
      t.text :razon
      t.text :experiencia
      t.string :imagen_previa_mascota
      t.boolean :compromiso_cuidado

      t.timestamps
    end
  end
end
