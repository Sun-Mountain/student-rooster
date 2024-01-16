class Student < ApplicationRecord
  belongs_to :team

  validates :first_name, :last_name, :contact, presence: true
end
