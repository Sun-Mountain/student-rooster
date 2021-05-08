class Team < ApplicationRecord
  belongs_to :user
  has_many :lessons

  validates :name, presence: true
end
