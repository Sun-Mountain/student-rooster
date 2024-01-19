# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @team = find_team(params[:team_id])
    @owner = find_owner_by_team(@team.id)
    @memberships = @team.memberships.where(accepted: true)
    @pending = @team.memberships.where(accepted: nil)

    breadcrumbs.add "Team: #{@team.name}", team_path(@team.id)
  end

  def new
    @team = find_team(params[:team_id])
    @membership = @team.memberships.new
    @owner = find_owner_by_team(@team.id)
  end

  def create
    @team = find_team(params[:team_id])
    @user = find_user_by_email(membership_params[:email])
    if @user.nil?
      @membership = @team.memberships.new(membership_params)
      @membership.no_account = true
      @membership.invited_by = current_user.id
      if @membership.save
        redirect_to team_memberships_path(@team.id), notice: 'Membership was successfully created.'
      else
        flash.now[:alert] = "Membership could not be created: #{model_error_string(@membership)}."
        render :new, status: :unprocessable_entity
      end
    else
      @membership = @team.memberships.new(membership_params)
      @membership.user_id = @user.id
      @membership.no_account = false
      @membership.invited_by = current_user.id
      if @membership.save
        redirect_to team_memberships_path(@team.id), notice: 'Membership was successfully created.'
      else
        flash.now[:alert] = "Membership could not be created: #{model_error_string(@membership)}."
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :email, :accepted, :no_account, :invited_by)
  end
end
