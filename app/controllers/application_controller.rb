class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password
      )
    end

    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(
        :first_name, :last_name, :email, :password, :password_confirmation,
        :current_password
      )
    end
  end

  def model_error_string(resource)
    resource.errors.full_messages.join(', ')
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    request.referrer || root_path
  end

  def lessons_controller?
    params[:controller] == 'lessons'
  end

  def students_controller?
    params[:controller] == 'students'
  end

  def teams_controller?
    params[:controller] == 'teams'
  end

  def team_id
    Team.find(params[:team_id])
  end
end
