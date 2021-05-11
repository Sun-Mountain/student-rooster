class UniqueRosterLink < ApplicationRecord
  belongs_to :lesson
  belongs_to :roster
  belongs_to :student
  belongs_to :unique_roster
end
