class CreateLessonStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_students do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
