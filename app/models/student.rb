class Student < ApplicationRecord
  has_many :rosters
  has_many :lessons, through: :rosters
end
