class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.string :github_url
      t.string :image_url

      t.timestamps null: false
    end

    add_index :users, :name
    add_index :users, :provider
    add_index :users, :uid
  end
end
