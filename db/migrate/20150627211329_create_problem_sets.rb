class CreateProblemSets < ActiveRecord::Migration
  def change
    create_table :problem_sets do |t|
      t.text :title
      t.date :deploy_date

      t.timestamps null: false
    end
  end
end
