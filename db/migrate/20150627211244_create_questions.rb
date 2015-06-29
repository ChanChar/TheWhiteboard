class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.text :set_title
      t.integer :problem_set_id

      t.timestamps null: false
    end

    add_index :questions, :problem_set_id
  end
end
