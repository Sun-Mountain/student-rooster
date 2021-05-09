class Roster < ApplicationRecord
  has_many :lesson_roster_links
  has_many :lessons, through: :lesson_roster_links
end
