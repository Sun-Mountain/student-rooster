class User < ApplicationRecord
  has_many :teams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def team
    team = self.teams.first
    return team.name
  end
end
