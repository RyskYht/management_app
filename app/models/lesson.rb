class Lesson < ApplicationRecord
  belongs_to :school
  belongs_to :room
  has_many :lesson_teachers, dependent: :delete_all
  has_many :teachers, through: :lesson_teachers
  has_many :lesson_students, dependent: :delete_all
  has_many :students, through: :lesson_students
end
