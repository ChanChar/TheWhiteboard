class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :question_id
      t.string :time_complexity
      t.string :space_complexity

      t.timestamps null: false
    end

    add_index :answers, :question_id
  end
end
