class Lesson < ApplicationRecord
  belongs_to team
  has

  validates_presence_of :name

  def no_description?
    description.blank?
  end

  def team_id
    teams.first.id
  end
end
