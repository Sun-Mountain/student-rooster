class Team < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  def no_lessons?
    lessons.count.zero?
  end
end
