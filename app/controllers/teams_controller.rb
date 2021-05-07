# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery

  def create
    @team = Team.new team_params

    if @team.save
      flash[:notice] = 'You have a team!'
    else
      flash[:alert] = "Team could not be created. Errors: #{model_error_string(@team)}"
    end

    redirect_to root_path
  end

  private

  def team_params
    params.require(:team).permit(:name, :user_id)
  end
end
