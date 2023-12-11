class AddPasswordDigestToOrganizacions < ActiveRecord::Migration[7.0]
  def change
    add_column :organizacions, :password_digest, :string
  end
end
