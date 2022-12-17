class Lesson < ApplicationRecord
  belongs_to :school
  belongs_to :room
  has_many :lesson_teachers, dependent: :destroy
  has_many :teachers, through: :lesson_teachers
  has_many :lesson_students, dependent: :destroy
  has_many :students, through: :lesson_students
end
