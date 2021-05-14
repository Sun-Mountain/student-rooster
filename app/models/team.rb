class Team < ApplicationRecord
  has_many :team_lessons, dependent: :destroy
  has_many :lessons, through: :team_lessons
  has_many :team_students, dependent: :destroy
  has_many :students, through: :team_students
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  validates_presence_of :name

  def no_lessons?
    lessons.count.zero?
  end
end
