class Lesson < ApplicationRecord
  has_many :team_lessons, dependent: :destroy
  has_many :teams, through: :team_lessons

  validates_presence_of :name
end
