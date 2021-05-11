# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team

    @lesson = lesson
    @roster = roster
    @student = student

    @unique_roster = @student.unique_rosters.create(roster_id: @roster.id, lesson_id: @lesson.id)
    binding.pry

    if @unique_roster.save
      flash[:notice] = 'Student added to class.'
    else
      flash[:alert] = "Lesson could not be created: #{model_error_string(@unique_roster)}"
    end

    redirect_to user_team_student_path(id: @student.id, user_id: @user.id, team_id: @team.id)
  end

  private

  def lesson
    Lesson.find(params[:unique_roster][:lesson_id])
  end

  def roster
    Roster.find(params[:unique_roster][:roster_id])
  end

  def student
    Student.find(params[:student_id])
  end

  def team
    Team.find(params[:team_id])
  end

  def unique_roster_params
    params.require(:unique_roster).(:student_id, :roster_id, :lesson_id)
  end

  def user
    User.find(params[:user_id])
  end
end
