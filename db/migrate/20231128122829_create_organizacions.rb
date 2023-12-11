class CreateOrganizacions < ActiveRecord::Migration[7.0]
  def change
    create_table :organizacions do |t|
      t.string :nombre
      t.string :direccion
      t.string :numero_contacto
      t.string :logo
      t.text :colectas_asociadas

      t.timestamps
    end
  end
end
