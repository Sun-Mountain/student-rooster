class Student < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  def no_students?
    count.zero?
  end
end
