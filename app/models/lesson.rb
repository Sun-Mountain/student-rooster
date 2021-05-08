class Lesson < ApplicationRecord
  belongs_to :team

  validates :name, :team_id, presence: true
end
