class Family < ApplicationRecord
  has_secure_password
  
  belongs_to :school
  has_many :students, dependent: :destroy_async
  has_many :tuitions, dependent: :delete_all
end
