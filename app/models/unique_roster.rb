class UniqueRoster < ApplicationRecord
  belongs_to :roster
  belongs_to :student
end
