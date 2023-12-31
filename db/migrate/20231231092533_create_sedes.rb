class CreateSedes < ActiveRecord::Migration[7.0]
  def change
    create_table :sedes do |t|
      t.string :nombre
      t.string :direccion
      t.string :numero_contacto
      t.references :organizacion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
