# frozen_string_literal: true

class TeamOwnership < ApplicationRecord
  belongs_to :team
  belongs_to :user
end
