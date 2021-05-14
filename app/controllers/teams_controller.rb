# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = Team.new team_params

    if @team.save 
      add_team_to_user(@team)
      flash[:notice] = 'Welcome to the team!'
    else
      flash[:alert] = "Team could not be created: #{model_error_string(@team)}"
    end

    redirect_to portal_path
  end

  def edit
    @team = Team.find(team_id)
  end

  def update
    @team = Team.find(team_id)

    if @team.update(team_params)
      flash[:notice] = 'Team updated.'
      redirect_to root_path
    else
      flash[:alert] = "Team could not be updated: #{model_error_string(@team)}"
      render :edit
    end
  end

  private

  def add_team_to_user(team)
    current_user.teams << team
  end

  def team_id
    params[:id]
  end

  def team_params
    params.require(:team).permit(:name)
  end

  def user_id
    current_user.id
  end
end
