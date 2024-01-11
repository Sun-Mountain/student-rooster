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
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
    # @team_owner = User.find(@team.user_id)
    @team_members = @team.users
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
