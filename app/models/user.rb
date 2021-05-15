class User < ApplicationRecord
  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, presence: true

  def no_teams?
    teams.count.zero?
  end

  def team
    teams.first
  end

  def team_id
    return teams.first.id if team.present?
  end

  def team_lessons
    teams.first.lessons
  end

  def team_name
    teams.first.name
  end
end
