class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :profile, :text
    add_column :users, :image_id, :string
    add_column :users, :external_link, :string
  end
end
