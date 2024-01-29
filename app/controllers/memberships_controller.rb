# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :authenticate_user!

  after_action :redirect_to_team, only: [:create]

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
    @owner = find_owner_by_team(@team.id)
    if @user.nil?
      @membership = @team.memberships.new(membership_params)
      @membership.no_account = true
      @membership.invited_by = current_user.id
      respond_to do |format|
        if @membership.save
          format.html { redirect_to team_memberships_path(@team.id), notice: "Post was successfully created." }
          format.turbo_stream {
            render turbo_stream: turbo_stream.append('pending', partial: 'memberships/membership',
            locals: {membership: @membership}, notice: "Post was successfully created.")
          }
          format.json { render :index, status: :created, location: @membership }
        else
          format.html { render :index, status: :unprocessable_entity }
          format.json { render json: @membership.errors, status: :unprocessable_entity }
        end
      end
    else
      @membership = @team.memberships.new(membership_params)
      @membership.user_id = @user.id
      @membership.no_account = false
      @membership.invited_by = current_user.id
      respond_to do |format|
        if @membership.save
          format.html { redirect_to team_memberships_path(@team.id), notice: "Post was successfully created." }
          format.turbo_stream {
            render turbo_stream: turbo_stream.append('pending', partial: 'memberships/membership',
            locals: {membership: @membership}, notice: "Post was successfully created.")
          }
          format.json { render :index, status: :created, location: @membership }
        else
          format.html { render :index, status: :unprocessable_entity }
          format.json { render json: @membership.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def accept
    @team = find_team(params[:team_id])
    @membership = find_membership
    @membership.accepted = true
    if @membership.save
      redirect_to team_path(@team.id), notice: "You are now a member of #{@team.name}."
    else
      redirect_to team_path(@team.id), alert: "Something went wrong."
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id, :team_id, :email, :accepted, :no_account, :invited_by)
  end

  def find_membership
    @membership = Membership.find(params[:membership_id])
  end


  def redirect_to_team
    @team = find_team(params[:team_id])
    @pending = @team.memberships.where(accepted: nil)
    unless @pending.count > 1
      redirect_to team_memberships_path(@team.id), notice: "Post was successfully created."
      return
    end
  end
end
