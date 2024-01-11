# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to team_path(@team.id), notice: "Team was successfully created."
    else
      flash.now[:alert] = "Team could not be created: #{model_error_string(@team)}."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = Team.find(params[:id])
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
    @team_members = @team.users
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = current_user.teams.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team.id), notice: 'Team was successfully updated.'
    else
      render :edit, alert: 'Team was not updated.'
    end
  end

  def destroy
    @team = current_user.teams.find(params[:id])
    if @team.destroy
      redirect_to root_path, notice: 'Team was successfully destroyed.'
    else
      redirect_to team_path(@team.id), alert: 'Team was not destroyed.'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
