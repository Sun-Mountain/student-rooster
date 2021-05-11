# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @student = student

    if inputs_present?(params) && unique_class?(params)
      @lesson = lesson
      @roster = roster
      @unique_roster = create_unique_roster(@student.id)

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
    else
      return_error(params)
    end

    redirect_to user_team_student_path(id: @student.id, user_id: @user.id, team_id: @team.id)
  end

  private

  def create_unique_roster(student_id)
    UniqueRoster.create(student_id: student_id)
  end

  def create_unique_roster_link(lesson, roster, student, unique_roster)
    UniqueRosterLink.create(lesson_id: lesson.id, roster_id: roster.id, student_id: student.id, unique_roster_id: unique_roster.id)
  end

  def from_student?
    params[:add_student]
  end

  def inputs_present?(params)
    params[:unique_roster][:lesson_id].present? && params[:unique_roster][:roster_id].present? && params[:student_id].present?
  end

  def lesson
    Lesson.find(params[:unique_roster][:lesson_id])
  end

  def return_error(params)
    errors = []

      if params[:unique_roster][:lesson_id].blank?
        string = "Select a lesson"
        errors.push(string)
      end

      if params[:unique_roster][:lesson_id].present? && params[:unique_roster][:roster_id].blank?
        string = "Select a roster"
        errors.push(string)
      end

      if params[:student_id].blank?
        string = "Select a student"
        errors.push(string)
      end

    flash[:alert] = "Unique Roster could not be created: #{errors.join(', ')}"
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
    params.require(:unique_roster).permit(:id, :lesson_id)
  end

  def user
    User.find(params[:user_id])
  end
end
