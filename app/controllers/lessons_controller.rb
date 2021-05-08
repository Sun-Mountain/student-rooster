# frozen_string_literal: true

class LessonsController < ApplicationController
  before_action :authenticate_user!
end
