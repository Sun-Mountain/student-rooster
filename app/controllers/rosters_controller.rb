# frozen_string_literal: true

class RostersController < ApplicationController
  # include RequirePermissionHelper
  before_action :authenticate_user!

  def create
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
      redirect_to team_lesson_path(@team.id, lesson.id)
    end
  end

  def show
    @roster = roster
  end

  def destroy
    @team = team
    @lesson = lesson
    @roster = roster

    if delete_from_lesson && last_roster?
      flash[:notice] = 'Roster deleted.'
    elsif delete_from_lesson
      flash[:notice] = "Roster removed from #{@lesson.name}."
    else
      flash[:alert] = "Roster could not be deleted."
    end

    redirect_to team_lesson_path(@team.id, lesson.id)
  end

  private

  def add_to_all_lessons
    if roster_valid?(@roster)
      @lessons.each do |lesson|
        lesson.rosters << @roster
      end
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
    params.require(:roster).permit(:id, :name, :begin_date, :end_date, :lesson_id)
  end

  def roster_valid?(roster)
    roster.begin_date.present? && roster.end_date.present?
  end

  def team
    Team.find(params[:team_id])
  end
end
