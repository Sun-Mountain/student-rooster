class Roster < ApplicationRecord
  attr_accessor :lesson_ids
  has_many :lesson_roster_links
  has_many :lessons, through: :lesson_roster_links
  has_many :unique_roster_links
  has_many :unique_rosters, through: :unique_roster_links

  validates_presence_of :begin_date, :end_date

  def dates
    "#{begin_date.try(:to_formatted_s, :rfc822)} - #{end_date.try(:to_formatted_s, :rfc822)}"
  end
end
