class UniqueRoster < ApplicationRecord
  belongs_to :lesson
  belongs_to :roster
  belongs_to :student

  def lesson
    Lesson.find(lesson_id).name
  end

  def roster
    Roster.find(roster_id).dates
  end
end
