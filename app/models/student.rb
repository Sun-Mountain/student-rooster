class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def no_students?
    count.zero?
  end
end
