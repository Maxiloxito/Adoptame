class CreateColectas < ActiveRecord::Migration[7.0]
  def change
    create_table :colectas do |t|
      t.string :nombre
      t.text :descripcion
      t.date :fecha_inicio
      t.date :fecha_fin
      t.decimal :meta, precision: 10, scale: 2
      t.references :organizacion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
