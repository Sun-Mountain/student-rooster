class Roster < ApplicationRecord
  has_many :lesson_roster_items, dependent: :destroy
  has_many :lessons, through: :lesson_roster_items
  has_many :unique_rosters, dependent: :destroy

  validates_presence_of :begin_date, :end_date

  def dates
    "#{begin_date.try(:to_formatted_s, :rfc822)} - #{end_date.try(:to_formatted_s, :rfc822)}"
  end

  def label
    "#{name} : #{begin_date.try(:to_formatted_s, :rfc822)} - #{end_date.try(:to_formatted_s, :rfc822)}"
  end

  def no_unique_rosters?
    unique_rosters.count.zero?
  end
end
