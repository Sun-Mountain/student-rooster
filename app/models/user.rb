# frozen_string_literal: true

class User < ApplicationRecord
  has_many :team_ownerships, dependent: :destroy
  has_many :teams, through: :team_ownerships, dependent: :destroy
  has_many :memberships, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable, :trackable
  # :lockable

  enum role: %i[user beta admin moderator siteAdmin]

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
