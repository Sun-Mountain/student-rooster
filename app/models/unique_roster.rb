class UniqueRoster < ApplicationRecord
  belongs_to :student
  belongs_to :roster
  belongs_to :lesson

  validates :student, :roster, :lesson, uniqueness: true
end
