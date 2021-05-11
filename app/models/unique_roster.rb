class UniqueRoster < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
  belongs_to :roster
end
