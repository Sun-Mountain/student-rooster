# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  include RequirePermissionHelper
  before_action :authenticate_user!

  def create
    @unique_roster = student.unique_rosters.build(unique_roster_params)

    if @unique_roster.save
      flash[:notice] = 'Student added to Roster!'
    else
      flash[:alert] = "Student could not be added: #{model_error_string(@unique_roster)}"
    end

    redirect_to team_student_path(student.team_id, student.id)
  end

  def destroy
    @unique_roster = unique_roster

    if @unique_roster.destroy
      flash[:alert] = "Deleted"
    else
      flash[:alert] = "#{model_error_string(@lesson)}"
    end

    redirect_to :back
  end

  private

  def lesson
    Lesson.find(unique_roster_params[:lesson_id])
  end

  def roster
    Roster.find(unique_roster_params[:roster_id])
  end

  def student
    Student.find(unique_roster_params[:student_id])
  end

  def unique_roster_params
    params.require(:unique_roster).permit(:lesson_id, :roster_id, :student_id)
  end

  def unique_roster
    UniqueRoster.find(params[:id])
  end
end
