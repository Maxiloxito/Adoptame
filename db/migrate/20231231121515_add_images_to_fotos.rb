class AddImagesToFotos < ActiveRecord::Migration[7.0]
  def change
    add_column :fotos, :imagen2, :string
    add_column :fotos, :imagen3, :string
  end
end
