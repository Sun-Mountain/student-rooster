class Student < ApplicationRecord
  belongs_to :team
  has_many :unique_rosters, dependent: :destroy

  validates_presence_of :first_name, :last_name, :contact

  def name
    "#{first_name} #{last_name}"
  end

  def team_id
    team.id
  end
end
