#  frozen_string_literal: true

class UsersController < ApplicationController
  before_action :profile_permissions
  before_action :find_user

  def show; end

  def edit; end

  def update
    # Your code here
  end

  def destroy
    # Your code here
  end

  def permissions
    unless current_user.admin? || current_user.moderator?
      redirect_to root_path, alert: 'You are not authorized to access this page.'
    else

    end
  end

  private

  def user_params
    if current_user.admin?
      params.permit(:email)
    else
      params.required(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  def find_user
    @user = User.find_by(email: "#{params[:email]}.com") || current_user
  end

  def profile_permissions
    return unless !current_user.admin? && params[:email] != current_user.email

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end
end
