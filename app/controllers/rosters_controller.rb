# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @lesson = lesson
    @roster = @lesson.rosters.create(roster_params)

    if @roster.save(validate: false) && dates_present(@roster)
      flash[:notice] = "Roster added to #{@lesson.name}."
    else
      flash[:alert] = "Roster could not be created. Beginning and end dates required."
    end

    redirect_to user_team_lesson_path(@team.user_id, @team.id, lesson.id)
  end

  def destroy
    @user = user
    @team = team
    @lesson = lesson
    @roster = roster

    if @roster.destroy
      flash[:notice] = 'Roster deleted.'
    else
      flash[:alert] = "Roster could not be created: #{model_error_string(@roster)}"
    end

    redirect_to user_team_lesson_path(@user.id, @team.id, lesson.id)
  end

  private

  def dates_present(roster)
    roster.begin_date.present? && roster.end_date.present?
  end

  def lesson
    Lesson.find(params[:lesson_id])
  end

  def roster
    Roster.find(params[:id])
  end

  def roster_params
    params.require(:roster).permit(:id, :begin_date, :end_date, :student_id, :lesson_id)
  end

  def team
    Team.find(params[:team_id])
  end

  def user
    User.find(params[:user_id])
  end
end
