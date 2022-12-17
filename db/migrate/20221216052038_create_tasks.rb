class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :school, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.datetime :start
      t.datetime :finish
      t.datetime :end
      t.text :content
      t.text :comment

      t.timestamps
    end
  end
end
