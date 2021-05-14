# frozen_string_literal: true

module RequirePermissionHelper
  extend ActiveSupport::Concern
  included do
    before_action :require_permissions
  end

  protected

  def require_permissions
    if teams_controller?
      unless params[:action] == "create" || team.users.include?(current_user)
        redirect_to root_path, alert: "You are not a part of that team."
      end
    elsif lessons_controller?
      return if params[:action] == 'create'

      lesson_teams = lesson.teams
      user_teams = current_user.teams

      find_teams = lesson_teams & user_teams

      if find_teams.blank?
        redirect_to root_path, alert: "You are not a part of that team."
      end
    end
  end

end