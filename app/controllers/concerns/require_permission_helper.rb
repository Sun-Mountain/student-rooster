# frozen_string_literal: true

module RequirePermissionHelper
  extend ActiveSupport::Concern
  included do
    before_action :require_permissions
  end

  protected

  def require_permissions
    unless current_user.nil?
      user_teams = current_user.teams
      if teams_controller?
        unless params[:action] == "create" || team.users.include?(current_user)
          redirect_to root_path, alert: "You are not a part of that team."
        end
      elsif unique_rosters_controller?
        unless  params[:action] == "destroy"
          student = Student.find(unique_roster_params[:student_id])
          team = student.team

          unless user_teams.include?(team)
            redirect_to root_path, alert: "You are not a part of that team."
          end
        end
      elsif team_id.present?
        team = Team.find(params[:team_id])
        session[:return_to] ||= request.referer

        unless user_teams.include?(team)
          redirect_to root_path, alert: "You are not a part of that team."
        end
      end
    end
  end

end