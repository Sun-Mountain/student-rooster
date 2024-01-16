# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :team
  has_many :lessons, dependent: :destroy

  validates :title, presence: true
end
