class Lesson < ApplicationRecord
  belongs_to :team
  has_many :rosters
  has_many :students, through: :rosters

  validates_presence_of :name

  def no_rosters?
    Roster.where(lesson_id: self.id).count.zero?
  end
end
