class AddSedeToAnimals < ActiveRecord::Migration[6.0]
  def change
    add_reference :animals, :sede, null: true, foreign_key: true
  end
end