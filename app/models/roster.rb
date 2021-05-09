class Roster < ApplicationRecord
  belongs_to :students
  belongs_to :lessons
end
