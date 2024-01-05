class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :deny_content_type_json, only: [:create, :update]

  # GET /users

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :username, :role)
  end
end
