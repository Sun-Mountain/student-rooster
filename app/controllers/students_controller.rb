# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = user
    @team = team
    @students = Student.all
    @student = Student.new
  end

  def create
    @student = Student.new student_parms

    if @student.save
      flash[:notice] = 'Student added.'
    else
      flash[:alert] = "Student could not be added: #{model_error_string(@student)}"
    end

    redirect_to students_path
  end

  def edit
  end

  def update
  end

  def destroy
    @student = Student.find(student_id)
    
    if @student.destroy
      flash[:notice] = 'Student deleted.'
    else
      flash[:alert] = "Student could not be updated: #{model_error_string(@student)}"
    end

    redirect_to students_path
  end

  private

  def user
    current_user
  end

  def student_id
    params[:id]
  end

  def student_parms
    params.require(:student).permit(:id, :first_name, :last_name, :email)
  end

  def team
    user.teams.first
  end
end