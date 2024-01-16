# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @owner = find_owner_by_team(@team.id)
    @session = @lesson.sessions.new
  end

  def create
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @owner = find_owner_by_team(@team.id)
    @session = @lesson.sessions.new(session_params)
    if @session.save
      redirect_to team_lesson_path(@team.id, @lesson.id), notice: 'Session was successfully created.'
    else
      flash.now[:alert] = "Session could not be created: #{model_error_string(@session)}."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :start_date, :end_date, :lesson_id)
  end
end
