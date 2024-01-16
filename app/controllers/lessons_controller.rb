# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = team
    @lesson = @team.lessons.new
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
  end

  def create
    @team = team
    @lesson = @team.lessons.new(lesson_params)
    if @lesson.save
      redirect_to team_path(@team.id), notice: "Lesson was successfully created."
    else
      flash.now[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = team
    @lesson = @team.lessons.find(params[:id])
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
  end

  def edit
    @team = team
    @lesson = @team.lessons.find(params[:id])
    @team_ownership = TeamOwnership.find_by(team_id: @team.id)
    @owner = User.find(@team_ownership.user_id)
  end

  def update
    @team = team
    @lesson = @team.lessons.find(params[:id])
    if @lesson.update(lesson_params)
      redirect_to team_lesson_path(@team.id, @lesson.id), notice: "Team was successfully updated."
    else
      flash.now[:alert] = "Team could not be updated: #{model_error_string(@team)}."
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:id, :title, :team_id)
  end

  def team
    Team.find(params[:team_id])
  end
end
