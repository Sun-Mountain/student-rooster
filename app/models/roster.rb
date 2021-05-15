class Roster < ApplicationRecord
  has_many :lesson_roster_items, dependent: :destroy
  has_many :lessons, through: :lesson_roster_items
end
