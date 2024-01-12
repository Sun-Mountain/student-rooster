# frozen_string_literal: true

class User < ApplicationRecord
  has_many :team_ownerships, dependent: :destroy
  has_many :teams, through: :team_ownerships, dependent: :destroy
  has_many :memberships, dependent: :destroy

  enum role: %i[user beta admin moderator siteAdmin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :timeoutable, :trackable
  # :lockable
end
