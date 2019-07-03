class AddForeignKey < ActiveRecord::Migration[5.2]
  def change

    add_foreign_key :photos, :users
    add_foreign_key :albums, :users
    add_foreign_key :likes, :users
    add_foreign_key :pictures, :albums
    #loi khong chay dc 3 dong cuoi
    add_foreign_key :likes, :photos
    add_foreign_key :likes, :albums
    add_foreign_key :follows, :users
  end
end
