class School < ApplicationRecord
  has_secure_password
  
  belongs_to :manager
  has_many :teachers, dependent: :destroy_async
  has_many :families, dependent: :destroy_async
  has_many :rooms, dependent: :delete_all
  has_many :announcements, dependent: :destroy_async
  has_many :students, dependent: :destroy_async
  has_many :lessons, dependent: :destroy_async
  has_many :tasks, dependent: :delete_all
  has_many :tuitions, dependent: :delete_all
end
