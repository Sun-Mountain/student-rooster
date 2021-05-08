# frozen_string_literal: true

class TeamsController < ApplicationController
  def create
    @user = User.find(user_id)
    @team = @user.teams.create(team_params)
    # binding.pry

    if @team.save 
      flash[:notice] = 'Welcome to the team!'
    else
      flash[:alert] = "Team could not be created: #{model_error_string(@team)}"
    end

    redirect_to root_path
  end

  private

  def user_id
    params[:user_id]
  end

  def team_params
    params.require(:team).permit(:id, :name, :user_id)
  end
end
