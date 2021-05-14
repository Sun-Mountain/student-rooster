class TeamLesson < ApplicationRecord
  belongs_to :lesson
  belongs_to :team
end
