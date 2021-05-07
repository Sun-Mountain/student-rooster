# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery

  def create
    @lesson = Lesson.new lesson_params

    if @lesson.save
    else
      flash[:alert] = "Lesson could not be created. Errors: #{model_error_string(@lesson)}"
    end

    redirect_to root_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, :team_id)
  end
end
