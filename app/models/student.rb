class Student < ApplicationRecord
  has_many :roster_student_links, dependent: :destroy
  has_many :rosters, through: :roster_student_links

  validates :first_name, :last_name, :email, :phone_num, presence: true
end
