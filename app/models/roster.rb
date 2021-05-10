class Roster < ApplicationRecord
  attr_accessor :lesson_ids
  has_many :lesson_roster_links, dependent: :destroy
  has_many :lessons, through: :lesson_roster_links
  has_many :roster_student_links, dependent: :destroy
  has_many :students, through: :roster_student_links

  validates_presence_of :begin_date, :end_date

  def dates
    "#{begin_date.try(:to_formatted_s, :rfc822)} - #{end_date.try(:to_formatted_s, :rfc822)}"
  end

  def no_students?
    students.count.zero?
  end
end
