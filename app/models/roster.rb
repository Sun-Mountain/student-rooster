class Roster < ApplicationRecord
  has_many :lesson_rosters, dependent: :destroy
  has_many :lessons, through: lesson_rosters
end
