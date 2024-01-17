# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :success
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :add_initial_breadcrumbs

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def model_error_string(resource)
    resource.errors.full_messages.join(', ')
  end

  protected

  def add_initial_breadcrumbs
    breadcrumbs.add "Home", root_path
  end

  def authorize_siteAdmin!
    return if current_user.siteAdmin?

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def find_owner_by_team(team_id)
    @team_ownership = TeamOwnership.find_by(team_id: team_id)
    return User.find(@team_ownership.user_id)
  end

  def find_team(team_id)
    @team ||= Team.find(team_id)
  end

  def find_lesson(lesson_id)
    @lesson ||= Lesson.find(lesson_id)
  end
end
