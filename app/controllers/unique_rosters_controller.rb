# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @student = student

    if inputs_present? && unique_class?
      @lesson = lesson
      @roster = roster
      @unique_roster = create_unique_roster(student_id)

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
      return_errors
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

  def inputs_present?
    lesson_id.present? && roster_id.present? && student_id.present?
  end

  def lesson
    Lesson.find(lesson_id)
  end

  def lesson_id
    params[:unique_roster][:lesson_id]
  end

  def return_errors
    errors = []

      if lesson_id.blank?
        string = "Select a lesson"
        errors.push(string)
      end

      if roster_id.blank?
        string = "Select a roster"
        errors.push(string)
      end

      if student_id.blank?
        string = "Select a student"
        errors.push(string)
      end

      unless unique_class?
        string = "Student is already enrolled."
        errors.push(string)
      end

    flash[:alert] = "Unique Roster could not be created: #{errors.join(', ')}"
  end

  def roster
    Roster.find(roster_id)
  end

  def roster_id
    params[:unique_roster][:roster_id]
  end

  def student
    Student.find(student_id)
  end

  def student_id
    params[:student_id]
  end

  def team
    Team.find(params[:team_id])
  end

  def unique_class?
    unique_r_l = UniqueRosterLink.where(student_id: student_id, lesson_id: lesson_id, student_id: student_id)
    unique_r_l.blank?
  end

  def unique_roster_params
    params.require(:unique_roster).permit(:id, :lesson_id)
  end

  def user
    User.find(params[:user_id])
  end
end
