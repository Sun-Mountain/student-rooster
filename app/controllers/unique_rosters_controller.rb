# frozen_string_literal: true

class UniqueRostersController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
  end
end
