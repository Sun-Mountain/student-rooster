# frozen_string_literal: true

class StudentsController < ApplicationController
  include RequirePermissionHelper
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

  def show
    @student = student
  end

  def edit
    @student = student
  end

  def update
    @student = student

    if @student.update(student_params)
      flash[:notice] = 'Student updated.'
      redirect_to team_student_path(team_id: team_id, id: student.id)
    else
      flash[:alert] = "Student could not be updated: #{model_error_string(@student)}"
      render :edit
    end
  end

  def destroy
    @student = student

    if @student.destroy
      flash[:notice] = 'Student deleted.'
      redirect_to team_students_path(team_id)
    else
      flash[:alert] = "Student could not be updated: #{model_error_string(@student)}"
      render :show
    end
  end

  private

  def student
    Student.find(params[:id])
  end

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