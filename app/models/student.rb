class Student < ApplicationRecord
  has_many :unique_rosters, dependent: :destroy
  has_many :lessons, through: :unique_rosters
  has_many :rosters, through: :unique_rosters

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def no_unique_rosters?
    unique_rosters.count.zero?
  end

  def student_unique_rosters
    UniqueRoster.where(student_id: self.id)
  end
end
