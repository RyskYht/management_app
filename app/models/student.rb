class Student < ApplicationRecord
  has_secure_password
  
  belongs_to :school
  belongs_to :family
  has_many :lesson_students, dependent: :delete_all
  has_many :lessons, through: :lesson_students
  has_many :announcement_students, dependent: :delete_all
  has_many :announcements, through: :announcement_students
  has_many :tasks, dependent: :delete_all
end
