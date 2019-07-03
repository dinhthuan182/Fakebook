class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string  :title
      t.references :imageable, polymorphic: true, index: true
      t.references :photos, index: true
      t.references :albums, index: true
      t.timestamps
    end
  end
end
