class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :user1, null: false
      t.integer :user2, null: false
      t.integer :user3

      t.timestamps null: false
    end

    add_index :pairs, :user1
    add_index :pairs, :user2
    add_index :pairs, :user3
  end
end
