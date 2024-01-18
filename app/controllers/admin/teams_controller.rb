# frozen_string_literal: true

module Admin
  class TeamsController < ApplicationController
    before_action :authorize_admin!

    def index
      @team = Team.all
      @teams_count = @team.count
      @user_count = User.all.count
    end
  end
end
