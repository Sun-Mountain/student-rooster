# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery
end
