# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = team
    @lesson = @team.lessons.create(lesson_params)
    binding.pry

    if @lesson.save
      flash[:notice] = 'Lesson created.'
    else
      flash[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}"
    end

    redirect_to root_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:id, :name, :descrption)
  end

  def team
    Team.find(params[:team_id])
  end
end
