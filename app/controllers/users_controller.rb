#  frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user
  before_action :profile_permissions

  def show; end

  def edit; end

  def update
    # Your code here
  end

  def destroy
    # Your code here
  end

  private

  def user_params
    if current_user.authorized?
      params.permit(:email)
    else
      params.required(:user).permit(:id, :username, :email, :password, :password_confirmation, :current_password)
    end
  end

  def find_user
    @user = User.find_by(email: "#{params[:email]}.com") || current_user
  end

  def profile_permissions
    return unless !current_user.authorized? && params[:email] != current_user.email
    
    return unless current_user.id != @user.id

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
