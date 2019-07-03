class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.references :postable, polymorphic: true, index: true
      t.references :photos, index: true
      t.references :albums, index: true
      t.timestamps
    end
  end
end
