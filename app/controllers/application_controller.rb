# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :password)
    end
  end

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      @decoded = JwtToken.decode(header)
      return if current_user.id === @decoded[:sub]
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def authenticate_password(account_update_params)
    @user.valid_password?(account_update_params[:current_password])
  end

  def deny_content_type_json
    return unless request.content_type == 'application/json'
    render json: { message: 'Content-Type must be application/json' },
           status: :unsupported_media_type
  end
end
