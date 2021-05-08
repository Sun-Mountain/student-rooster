class Lesson < ApplicationRecord
  belongs_to :team

  validates_presence_of :name
end
