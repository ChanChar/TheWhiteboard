class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.text :description
      t.integer :question_id

      t.timestamps null: false
    end

    add_index :hints, :question_id
  end
end
