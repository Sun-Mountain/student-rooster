# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = user
    @team = team
    @lesson = lesson
    
    if params[:add_to_all]
      @roster = Roster.create roster_params
      @lessons = Lesson.all

      if add_to_all_lessons
        flash[:notice] = "Roster added to all Lessons."
      else
        flash[:alert] = "Roster could not be created. (Check to make sure dates present.)"
      end

      redirect_to root_path
    else
      @single_roster = @lesson.rosters.create(roster_params)
      if @single_roster.save
        flash[:notice] = "Roster added to #{@lesson.name}."
      else
        flash[:alert] = "Roster could not be created. (Check to make sure dates present.)"
      end
      redirect_to user_team_lesson_path(@team.user_id, @team.id, lesson.id)
    end
  end

  def show
    @lesson = lesson
    @roster = roster

    @roster_student_list = Roster.roster_student_list
  end

  def destroy
    @user = user
    @team = team
    @lesson = lesson
    @roster = roster

    if delete_from_lesson && last_roster?
      flash[:notice] = 'Roster deleted.'
    elsif delete_from_lesson
      flash[:notice] = "Roster removed from #{@lesson.name}."
    else
      flash[:alert] = "Roster could not be created. (Check to make sure dates present.)"
    end

    redirect_to user_team_lesson_path(@user.id, @team.id, lesson.id)
  end

  private

  def add_to_all_lessons
    if roster_valid?(@roster)
      @lessons.each do |lesson|
        lesson.rosters << @roster
      end
    else
      return false
    end
  end

  def delete_from_lesson
    @lesson.rosters.delete(@roster)
  end

  def last_roster?
    if @roster.lessons.count.zero?
      @roster.destroy
    end
  end

  def lesson
    Lesson.find(params[:lesson_id])
  end

  def roster
    Roster.find(params[:id])
  end

  def roster_params
    params.require(:roster).permit(:id, :begin_date, :end_date, :lesson_id)
  end

  def roster_valid?(roster)
    roster.begin_date.present? && roster.end_date.present?
  end

  def team
    Team.find(params[:team_id])
  end

  def user
    User.find(params[:user_id])
  end
end
