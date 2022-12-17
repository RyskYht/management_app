class Room < ApplicationRecord
  belongs_to :school
  has_many :lessons, dependent: :nullify
end
