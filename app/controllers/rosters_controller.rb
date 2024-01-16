# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @team = team
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
    @lesson = lesson
    @roster = @lesson.rosters.new
  end

  def create
    @team = team
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
    @lesson = lesson
    @roster = @lesson.rosters.new(roster_params)
    if @roster.save
      redirect_to team_lesson_path(@team.id, @lesson.id), notice: "Roster was successfully created."
    else
      flash.now[:alert] = "Roster could not be created: #{model_error_string(@roster)}."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def roster_params
    params.require(:roster).permit(:lesson_id, :name, :start_date, :end_date)
  end

  def lesson
    @lesson ||= Lesson.find(params[:lesson_id])
  end

  def team
    @team ||= Team.find(params[:team_id])
  end
end
