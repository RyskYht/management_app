class Announcement < ApplicationRecord
  belongs_to :school
  has_many :announcement_students, dependent: :delete_all
  has_many :students, through: :announcement_students
end
