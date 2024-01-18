# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authorize_admin!

  def index
    @teams_count = Team.all.count
    @user_count = User.all.count
  end
end
