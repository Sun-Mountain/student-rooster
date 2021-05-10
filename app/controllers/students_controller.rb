# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @lesson = lesson
    @roster = roster
    binding.pry

    @student = @roster.students.create(student_params)

    if @student.save
      flash[:notice] = "New student has been added to Roster."
    else
      flash[:alert] = "Student could not be created: #{model_error_string(@student)}"
    end

    redirect_to user_team_lesson_roster_path(@user.id, @team.id, @lesson.id, @roster.id)
  end

  private

  def lesson
    Lesson.find(params[:lesson_id])
  end

  def roster
    Roster.find(params[:roster_id])
  end

  def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :email, :phone_num, :roster_id)
  end

  def team
    Team.find(params[:team_id])
  end

  def user
    User.find(params[:user_id])
  end
end
