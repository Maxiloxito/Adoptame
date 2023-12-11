class AddCorreoToOrganizacions < ActiveRecord::Migration[7.0]
  def change
    add_column :organizacions, :correo, :string
  end
end
