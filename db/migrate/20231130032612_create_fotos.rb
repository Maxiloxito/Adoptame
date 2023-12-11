class CreateFotos < ActiveRecord::Migration[7.0]
  def change
    create_table :fotos do |t|
      t.references :animal, null: false, foreign_key: true
      t.string :imagen

      t.timestamps
    end
  end
end
