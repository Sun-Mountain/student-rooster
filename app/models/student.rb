class Student < ApplicationRecord
  has_many :unique_rosters, dependent: :destroy
  has_many :unique_roster_links
  has_many :unique_rosters, through: :unique_roster_links
  has_many :lessons, through: :unique_roster_links

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def no_students?
    count.zero?
  end

  def no_unique_rosters?
    unique_rosters.count.zero?
  end
end
