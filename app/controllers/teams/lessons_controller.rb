# frozen_string_literal: true

module Teams
  class LessonsController < ApplicationController
    before_action :authenticate_user!
  end
end
