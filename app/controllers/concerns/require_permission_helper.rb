# frozen_string_literal: true

module RequirePermissionHelper
  extend ActiveSupport::Concern
  included do
    before_action :require_permissions
  end

  protected

  def require_permissions
    unless current_user.nil?
      if teams_controller?
        user_teams = current_user.teams
        unless params[:action] == "create" || team.users.include?(current_user)
          redirect_to root_path, alert: "You are not a part of that team."
        end
      elsif team_id.present?
        user_teams = current_user.teams
        team = Team.find(team_id)
        session[:return_to] ||= request.referer

        unless user_teams.include?(team)
          redirect_to root_path, alert: "You are not a part of that team."
        end
      end
    end
  end

end