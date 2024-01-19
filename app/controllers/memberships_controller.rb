# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @team = find_team(params[:team_id])
    @owner = find_owner_by_team(@team.id)
    @memberships = @team.memberships

    breadcrumbs.add "Team: #{@team.name}", team_path(@team.id)
  end

  def new
    @team = find_team(params[:team_id])
    @membership = @team.memberships.new
    @owner = find_owner_by_team(@team.id)
  end
end
