class Roster < ApplicationRecord
  attr_accessor :lesson_ids
  has_many :lesson_roster_links, dependent: :destroy
  has_many :lessons, through: :lesson_roster_links

  validates_presence_of :begin_date, :end_date
end
