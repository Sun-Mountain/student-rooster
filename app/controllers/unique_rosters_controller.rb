# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team

    @lesson = lesson
    @roster = roster
    @student = student
    @unique_roster = create_unique_roster
    binding.pry

    @unique_roster_link = create_unique_roster_link(@lesson, @roster, @student, @unique_roster)

    if @unique_roster_link.save
      if from_student?
        flash[:notice] = 'Student Added.' 
      else
        flash[:notice] = 'Success.'
      end
    else
      flash[:alert] = "Unique Roster could not be created: #{model_error_string(@unique_roster_link)}"
    end

    redirect_to user_team_student_path(id: @student.id, user_id: @user.id, team_id: @team.id)
  end

  private

  def create_unique_roster
    UniqueRoster.create
  end

  def from_student?
    params[:add_student]
  end

  def create_unique_roster_link(lesson, roster, student, unique_roster)
    UniqueRosterLink.create(lesson_id: lesson.id, roster_id: roster.id, student_id: student.id, unique_roster_id: unique_roster.id)
  end

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
    params.require(:unique_roster).permit(:id, :student_id, :lesson_id, :roster_id)
  end

  def user
    User.find(params[:user_id])
  end
end
