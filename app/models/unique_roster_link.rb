class UniqueRosterLink < ApplicationRecord
  belongs_to :lesson
  belongs_to :roster
  belongs_to :student
  belongs_to :unique_roster

  def lesson_name
    Lesson.find(lesson_id).name
  end

  def roster_dates
    Roster.find(roster_id).dates
  end
end
