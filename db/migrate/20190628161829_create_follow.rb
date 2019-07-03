class CreateFollow < ActiveRecord::Migration[5.2]
  def change
    def change
    create_table :follows do |t|
       t.references :follower
       t.references :followed
       t.references :users, index: true
       t.timestamps
    end
  end
  end
end
