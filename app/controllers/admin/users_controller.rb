# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_siteAdmin!

    def index
      @users = User.all
      @user_count = @users.count
      @teams_count = Team.all.count
    end
  end
end
