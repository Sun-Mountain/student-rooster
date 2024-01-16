# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :team

  validates :title, presence: true
end
