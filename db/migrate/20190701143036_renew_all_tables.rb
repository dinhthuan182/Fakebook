class RenewAllTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.attachment :avatar
      t.boolean :activated
      t.timestamps
    end
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.attachment :image
      t.boolean :sharing_mode, default: true
      t.references :user, index: true
      t.timestamps
    end
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.boolean :sharing_mode, default: true
      t.references :user, index: true
      t.timestamps
    end
    create_table :pictures do |t|
      t.attachment :image
      t.references :album, index: true
      t.timestamps
    end
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.references :postable, polymorphic: true
      t.references :photo, index: true
      t.references :album, index: true
      t.timestamps
    end
    create_table :follows do |t|
       t.references :follower
       t.references :followed
       t.references :user, index: true
       t.timestamps
    end
  end
end
