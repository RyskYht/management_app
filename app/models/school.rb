class School < ApplicationRecord
  has_secure_password
  
  belongs_to :manager
  has_many :teachers, dependent: :destroy
  has_many :families, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :announcements, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :tuitions, dependent: :destroy
end
