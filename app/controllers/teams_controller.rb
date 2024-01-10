# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!
end
