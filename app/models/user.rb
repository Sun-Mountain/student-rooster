class User < ApplicationRecord
  has_many :teams, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :email, presence: true

  def no_team?
    teams.count.zero?
  end

  def team
    teams.first
  end
end
