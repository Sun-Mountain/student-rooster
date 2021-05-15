class Roster < ApplicationRecord
  has_many :lesson_roster_items, dependent: :destroy
  has_many :lessons, through: :lesson_roster_items

  validates_presence_of :begin_date, :end_date
end
