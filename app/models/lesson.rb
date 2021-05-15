class Lesson < ApplicationRecord
  belongs_to :team

  validates_presence_of :name

  def no_description?
    description.blank?
  end

  def team_id
    team.id
  end
end
