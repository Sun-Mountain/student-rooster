class Student < ApplicationRecord
  has_many :unique_roster_links, dependent: :destroy
  has_many :unique_rosters, through: :unique_roster_links

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def no_students?
    count.zero?
  end
end
