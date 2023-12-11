class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.string :correo
      t.string :numero_contacto
      t.string :oficio
      t.string :password_digest

      t.timestamps
    end
  end
end
