# frozen_string_literal: true

class RostersController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  private

  def user
    User.find(params[:user_id])
  end
end
