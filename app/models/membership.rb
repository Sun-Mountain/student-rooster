# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :team
  belongs_to :user
end
