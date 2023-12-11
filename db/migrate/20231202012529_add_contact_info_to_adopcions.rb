class AddContactInfoToAdopcions < ActiveRecord::Migration[7.0]
  def change
    add_column :adopcions, :correo, :string
    add_column :adopcions, :numero_contacto, :string
  end
end
