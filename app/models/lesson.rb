class Lesson < ApplicationRecord
  belongs_to :team
  has_many :lesson_roster_links, dependent: :destroy
  has_many :rosters, through: :lesson_roster_links
  has_many :lesson_student_links, dependent: :destroy
  has_many :students, through: :lesson_student_links

  validates_presence_of :name

  def no_rosters?
    lesson_roster_links.count.zero?
  end

  def present_rosters
    rosters.where('begin_date IS NOT NULL')
  end
end
