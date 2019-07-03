class DropAllTabels < ActiveRecord::Migration[5.2]
  def change
    drop_table :albums
    drop_table :likes
    drop_table :photos
    drop_table :users
  end
end
