class Team < ApplicationRecord
  has_many :team_lessons, dependent: :destroy
  has_many :lessons, through: :team_lessons
  has_many :students, dependent: :destroy
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  validates_presence_of :name

  def no_lessons?
    lessons.count.zero?
  end

  def no_students?
    students.count.zero?
  end

  def student_list
    Student.where("id IS NOT NULL AND team_id = :id", id: self.id)
  end
end
