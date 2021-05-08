class Team < ApplicationRecord
  belongs_to :user

  validates :name, presences: true
end
