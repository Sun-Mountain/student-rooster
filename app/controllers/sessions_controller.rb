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

  def show
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @owner = find_owner_by_team(@team.id)
    @session = @lesson.sessions.find(params[:id])
  end

  def edit
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @owner = find_owner_by_team(@team.id)
    @session = @lesson.sessions.find(params[:id])
  end

  def update
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @owner = find_owner_by_team(@team.id)
    @session = @lesson.sessions.find(params[:id])
    if @session.update(session_params)
      redirect_to team_lesson_session_path(@team.id, @lesson.id, @session.id), notice: 'Session was successfully updated.'
    else
      flash.now[:alert] = "Session could not be updated: #{model_error_string(@session)}."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = find_team(params[:team_id])
    @lesson = find_lesson(params[:lesson_id])
    @session = @lesson.sessions.find(params[:id])
    if @session.destroy
      redirect_to team_lesson_path(@team.id, @lesson.id), notice: 'Session was successfully destroyed.'
    else
      flash.now[:alert] = "Session could not be destroyed: #{model_error_string(@session)}."
      redirect_to team_lesson_path(@lesson.id), status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:id, :name, :start_date, :end_date, :lesson_id)
  end
end
