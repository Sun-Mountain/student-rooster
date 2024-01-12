# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :user_admin?

  def index
    @teams_count = Team.all.count
    @user_count = User.all.count
  end

  private

  def user_admin?
    current_user.siteAdmin?
  end
end
