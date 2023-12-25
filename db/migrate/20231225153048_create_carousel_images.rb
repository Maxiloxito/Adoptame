class CreateCarouselImages < ActiveRecord::Migration[7.0]
  def change
    create_table :carousel_images do |t|

      t.timestamps
    end
  end
end
