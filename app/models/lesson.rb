class Lesson < ApplicationRecord
  has_many :team_lessons, dependent: :destroy
  has_many :teams, through: :team_lessons

  validates_presence_of :name

  def no_description?
    description.blank?
  end

  def team_id
    teams.first.id
  end
end
