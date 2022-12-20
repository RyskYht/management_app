class Teacher < ApplicationRecord
  has_secure_password
  
  belongs_to :school
  has_many :lesson_teachers, dependent: :delete_all
  has_many :lessons, through: :lesson_teachers
  has_many :tasks, dependent: :delete_all
end
