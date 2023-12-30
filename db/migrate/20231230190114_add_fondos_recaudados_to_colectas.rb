class AddFondosRecaudadosToColectas < ActiveRecord::Migration[7.0]
  def change
    add_column :colectas, :fondos_recaudados, :decimal
  end
end
