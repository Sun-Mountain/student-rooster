class LessonRosterItem < ApplicationRecord
  belongs_to :lesson
  belongs_to :roster
end
