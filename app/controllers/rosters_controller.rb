# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @lesson = lesson
    
    if params[:add_to_all]
      @roster = Roster.create roster_params
      @lessons = Lesson.all
      @lessons.each do |lesson|
        lesson.rosters << @roster
      end
    else
      @single_roster = @lesson.rosters.create(roster_params)
      if @single_roster.save
        flash[:notice] = "Roster added to #{@lesson.name}."
      else
        flash[:alert] = "Roster could not be created. Beginning and end dates required."
      end
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

  def lesson
    Lesson.find(params[:lesson_id])
  end

  def roster
    Roster.find(params[:id])
  end

  def roster_params
    params.require(:roster).permit(:id, :begin_date, :end_date, :lesson_id)
  end

  def team
    Team.find(params[:team_id])
  end

  def user
    User.find(params[:user_id])
  end
end
