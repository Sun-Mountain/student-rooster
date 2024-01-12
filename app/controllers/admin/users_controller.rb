# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    def index
      @users = User.all
      @user_count = @users.count
      @teams_count = Team.all.count
    end
  end
end
