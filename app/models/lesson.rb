# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :team
  has_many :rosters, dependent: :destroy

  validates :title, presence: true
end
