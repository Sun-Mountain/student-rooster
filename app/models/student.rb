class Student < ApplicationRecord
  has_many :team_students, dependent: :destroy
  has_many :teams, through: :team_students
end
