# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = current_user.teams
    @memberships = current_user.memberships
  end
end
