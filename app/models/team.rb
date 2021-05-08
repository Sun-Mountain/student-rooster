class Team < ApplicationRecord
  belongs_to :user
  has_many :lessons, dependent: :destroy

  validates_presence_of :name

  def no_lessons?
    lessons.count.zero?
  end
end
