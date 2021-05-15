class LessonRoster < ApplicationRecord
  belongs_to :lesson
  belongs_to :roster
end
