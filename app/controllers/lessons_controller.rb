# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :add_breadcrumb

  def new
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.new
    @owner = find_owner_by_team(@team.id)
  end

  def create
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.new(lesson_params)
    @owner = find_owner_by_team(@team.id)
    if @lesson.save
      redirect_to team_path(@team.id), notice: 'Lesson was successfully created.'
    else
      flash.now[:alert] = "Lesson could not be created: #{model_error_string(@lesson)}."
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.find(params[:id])
    @owner = find_owner_by_team(@team.id)
  end

  def edit
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.find(params[:id])
    @owner = find_owner_by_team(@team.id)
  end

  def update
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.find(params[:id])
    @owner = find_owner_by_team(@team.id)
    if @lesson.update(lesson_params)
      redirect_to team_lesson_path(@team.id, @lesson.id), notice: 'Lesson was successfully updated.'
    else
      flash.now[:alert] = "Lesson could not be updated: #{model_error_string(@lesson)}."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = find_team(params[:team_id])
    @lesson = @team.lessons.find(params[:id])
    if @lesson.destroy
      redirect_to team_path(@team.id), notice: 'Lesson was successfully destroyed.'
    else
      flash.now[:alert] = "Lesson could not be destroyed: #{model_error_string(@lesson)}."
      redirect_to team_path(@lesson.id), status: :unprocessable_entity
    end
  end

  private

  def add_breadcrumb
    @team = find_team(params[:team_id])
    breadcrumbs.add "Team: #{@team.name}", team_path(@team.id)
  end

  def lesson_params
    params.require(:lesson).permit(:id, :title, :team_id)
  end
end
