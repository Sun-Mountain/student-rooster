# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    if @team.save
      redirect_to team_path(@team.id), notice: 'Team was successfully created.'
    else
      flash.now[:alert] = "Team could not be created: #{model_error_string(@team)}."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    unless current_user.memberships.exists?(team_id: params[:id]) || current_user.teams.exists?(id: params[:id])
      redirect_to root_path, alert: 'You are not a member of that team.'
    else
      @team = find_team(params[:id])
      @owner = find_owner_by_team(@team.id)
      @team_members = @team.memberships.where(accepted: true)
    end
  end

  def edit
    @team = find_team(params[:id])
    @owner = find_owner_by_team(@team.id)

    breadcrumbs.add "Team: #{@team.name}", team_path(@team.id)
  end

  def update
    @team = current_user.teams.find(params[:id])
    if @team.update(team_params)
      redirect_to team_path(@team.id), notice: 'Team was successfully updated.'
    else
      flash.now[:alert] = "Team could not be updated: #{model_error_string(@team)}."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = current_user.teams.find(params[:id])
    if @team.destroy
      redirect_to root_path, notice: 'Team was successfully destroyed.'
    else
      flash.now[:alert] = "Team could not be destroyed: #{model_error_string(@team)}."
      redirect_to team_path(@team.id), status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
