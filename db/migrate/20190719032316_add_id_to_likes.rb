class AddIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :id, :primary_key
  end
end
