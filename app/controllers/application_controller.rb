# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :info, :success
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

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

  def authorize_siteAdmin!
    unless current_user.siteAdmin?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
