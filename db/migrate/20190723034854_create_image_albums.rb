class CreateImageAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :image_albums do |t|
      t.integer :album_id
      t.string :image

      t.timestamps
    end
  end
end
