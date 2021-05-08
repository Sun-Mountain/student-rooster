# frozen_string_literal: true

class TeamsController < ApplicationController
  def create
    @user = User.find(user_id)
    @team = @user.teams.create(team_params)

    if @team.save 
      flash[:notice] = 'Welcome to the team!'
    else
      flash[:alert] = "Team could not be created: #{model_error_string(@team)}"
    end

    redirect_to root_path
  end

  def edit
    @user = User.find(user_id)
    @team = @user.teams.find(team_id)
  end

  def update
    @user = User.find(user_id)
    @team = @user.teams.find(team_id)

    if @team.update(team_params)
      flash[:notice] = 'Team updated.'
      redirect_to root_path
    else
      flash[:alert] = "Team could not be updated: #{model_error_string(@team)}"
      render :edit
    end
  end

  private

  def team_id
    params[:id]
  end

  def team_params
    params.require(:team).permit(:id, :name, :user_id)
  end

  def team_id
    params[:id]
  end

  def user_id
    params[:user_id]
  end
end
