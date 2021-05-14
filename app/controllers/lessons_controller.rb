# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission

  def create
    @lesson = Lesson.new lesson_params

    if @lesson.save
      add_lesson_to_team(@lesson)
      flash[:notice] = 'Lesson created!'
    else
      flash[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}"
    end

    redirect_to root_path
  end

  def show
    @lesson = lesson
  end

  def edit
    @lesson = lesson
  end

  def update
    @lesson = lesson

    if @lesson.update(lesson_params)
      flash[:notice] = 'Lesson updated.'
      redirect_to team_lesson_path(team_id: team_id, id: lesson.id)
    else
      flash[:alert] = "Lesson could not be updated: #{model_error_string(@lesson)}"
      render :edit
    end
  end

  def destroy
    @lesson = lesson

    if @lesson.destroy
      flash[:notice] = 'Lesson deleted.'
      redirect_to root_path
    else
      flash[:alert] = "Lesson could not be updated: #{model_error_string(@lesson)}"
      render :show
    end
  end

  private

  def add_lesson_to_team(lesson)
    team.lessons << lesson
  end

  def lesson
    Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end



  def require_permission
    return if params[:action] == 'create'

    lesson_teams = lesson.teams
    user_teams = current_user.teams

    find_teams = lesson_teams & user_teams

    if find_teams.blank?
      redirect_to root_path, alert: "You are not a part of that team."
    end
  end

  def team
    Team.find(params[:team_id])
  end

  def team_id
    params[:team_id]
  end
end
