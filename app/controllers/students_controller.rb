# frozen_string_literal: true

class StudentsController < ApplicationController
  # include RequirePermissionHelper
  before_action :authenticate_user!

  def index
  end

  private
end