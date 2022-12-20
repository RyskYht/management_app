class Manager < ApplicationRecord
  has_secure_password
  
  has_many :schools, dependent: :destroy_async
end