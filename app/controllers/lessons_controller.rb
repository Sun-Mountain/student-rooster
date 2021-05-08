# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!

  def create
    @team = team
    @lesson = @team.lessons.create(lesson_params)

    if @lesson.save
      flash[:notice] = 'Lesson created.'
    else
      flash[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}"
    end

    redirect_to root_path
  end

  def show
    @user = user
    @team = team
    @lesson = lesson
  end

  def edit
    @user = user
    @team = team
    @lesson = lesson
  end

  def update
    @user = user
    @team = team
    @lesson = lesson

    if @lesson.update(lesson_params)
      flash[:notice] = 'Lesson updated.'
      redirect_to user_team_lesson_path
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
      render :edit
    end
  end

  private

  def lesson
    Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:id, :name, :description)
  end

  def team
    Team.find(params[:team_id])
  end

  def user
    User.find(params[:user_id])
  end
end
