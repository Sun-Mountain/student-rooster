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
    @student = Student.new student_params

    if @student.save
      flash[:notice] = 'Student added.'
    else
      flash[:alert] = "Student could not be added: #{model_error_string(@student)}"
    end

    redirect_to students_path
  end

  def show
    @user = user
    @team = team
    @student = Student.find(student_id)
  end

  def edit
    @user = user
    @team = team
    @student = Student.find(student_id)
  end

  def update
    @user = user
    @team = team
    @student = Student.find(student_id)

    if @student.update(student_params)
      flash[:notice] = 'Team updated.'
      redirect_to user_team_student_path(id: @student.id, user_id: @user.id, team_id: @team.id)
    else
      flash[:alert] = "Student could not be updated: #{model_error_string(@student)}"
      render :edit
    end
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

  def remove_unique_roster
    @user = user
    @team = team
    @student = student

    if @student.unique_rosters.delete(unique_roster_id)
      delete_unique_roster(unique_roster_id)
      flash[:notice] = "Student removed from class."
    else
      flash[:alert] = "Student could not be removed from class."
    end

    redirect_to user_team_student_path(id: @student.id, user_id: @user.id, team_id: @team.id)
  end

  private

  def delete_unique_roster(unique_roster_id)
    UniqueRoster.find(unique_roster_id).destroy
  end

  def user
    current_user
  end

  def student
    Student.find(params[:student_id])
  end

  def student_id
    params[:id]
  end

  def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :email)
  end

  def team
    user.teams.first
  end

  def unique_roster_id
    params[:unique_roster_id]
  end
end