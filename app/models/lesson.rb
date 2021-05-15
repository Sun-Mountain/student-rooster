class Lesson < ApplicationRecord
  belongs_to :team
  has_many :lesson_roster_items, dependent: :destroy
  has_many :rosters, through: :lesson_roster_items

  validates_presence_of :name

  def no_description?
    description.blank?
  end

  def no_rosters?
    rosters.count.zero?
  end

  def team_id
    team.id
  end
end
