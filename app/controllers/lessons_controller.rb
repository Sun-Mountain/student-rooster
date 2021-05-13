# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lesson = Lesson.new lesson_params

    if @lesson.save
      add_lesson_to_team(@lesson)
      flash[:notice] = 'Lesson created!'
    else
      flash[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}"
    end

    redirect_to portal_path
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def add_lesson_to_team(lesson)
    team.lessons << lesson
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end

  def team
    Team.find(params[:team_id])
  end
end
