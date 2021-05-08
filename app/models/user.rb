class User < ApplicationRecord
  has_many :teams

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :full_name, :email, presence: true

  def no_team?
    teams.count.zero?
  end
end
