class Family < ApplicationRecord
  has_secure_password
  
  belongs_to :school
  has_many :students, dependent: :destroy
  has_many :tuitions, dependent: :destroy
end
