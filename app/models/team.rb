# frozen_string_literal: true

class Team < ApplicationRecord
  has_one :team_ownership, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :name, presence: true
end
