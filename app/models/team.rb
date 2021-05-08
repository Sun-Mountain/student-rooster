class Team < ApplicationRecord
  belongs_to :user
  has_many :lessons

  validates_presence_of :name
end
