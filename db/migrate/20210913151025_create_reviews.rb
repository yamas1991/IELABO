class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.string :title, null: false
      t.string :image_id
      t.string :body, null: false
      t.float :evaluation, null: false

      t.timestamps
    end
  end
end
