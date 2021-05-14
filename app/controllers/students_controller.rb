# frozen_string_literal: true

class StudentsController < ApplicationController
  # include RequirePermissionHelper
  before_action :authenticate_user!

  def index
    @user = current_user
    @team = team
  end

  def create
    @team = Team.find(team_id)
    @student = @team.students.create(student_params)

    if @student.save 
      flash[:notice] = 'Student added.'
    else
      flash[:alert] = "Student could not be added: #{model_error_string(@student)}"
    end

    redirect_to team_students_path(team_id)
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :contact, :team_id)
  end

  def team
    Team.find(current_user.team_id)
  end

  def team_id
    params[:team_id]
  end
end