# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = team
    @lesson = @team.lessons.new
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

  private

  def lesson_params
    params.require(:lesson).permit(:id, :title, :team_id)
  end

  def team
    Team.find(params[:team_id])
  end
end
