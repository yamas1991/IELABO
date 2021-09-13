class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

      t.string :shopname, null: false
      t.string :image_id
      t.string :address
      t.string :opentime
      t.string :external_link

      t.timestamps
    end
  end
end
