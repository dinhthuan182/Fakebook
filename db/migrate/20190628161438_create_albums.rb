class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :poster
      t.string :title
      t.text :description
      t.string :list_image
      t.boolean :sharing_mode
      t.references :user, index: true
      t.timestamps
    end
  end
end
