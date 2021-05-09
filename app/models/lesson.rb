class Lesson < ApplicationRecord
  belongs_to :team
  has_many :lesson_roster_links
  has_many :rosters, through: :lesson_roster_links

  validates_presence_of :name

  def no_rosters?
    Roster.where(lesson_id: self.id).count.zero?
  end

  def rosters
    Roster.where(lesson_id: self.id)
  end
end
