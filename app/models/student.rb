class Student < ApplicationRecord
  belongs_to :team

  def name
    "#{first_name} #{last_name}"
  end

  def team_id
    team.id
  end
end
