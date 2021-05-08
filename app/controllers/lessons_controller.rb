# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    @team = current_user.teams.first

    if @lesson.save
      redirect_to @lesson
    else
      redirect_to new_lesson_path
    end
  end

  def show
    @lesson = Lesson.find lesson_params[:id]
  end

  private

  def team_id
    team = current_user.teams.first
    return team.id
  end
end
