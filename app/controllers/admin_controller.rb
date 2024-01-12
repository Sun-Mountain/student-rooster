# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin?

  def index
    @users = User.all
  end

  private

  def user_admin?
    current_user.siteAdmin?
  end
end
