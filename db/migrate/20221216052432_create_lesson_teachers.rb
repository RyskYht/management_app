class CreateLessonTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_teachers do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
