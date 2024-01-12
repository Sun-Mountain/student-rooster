# frozen_string_literal: true

module Admin
  class TeamsController < ApplicationController
    def index
      @team = Team.all
      @teams_count = @team.count
      @user_count = User.all.count
    end
  end
end
