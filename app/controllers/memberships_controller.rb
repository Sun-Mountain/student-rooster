# frozen_string_literal: true

class MembershipsController < ApplicationController
  before_action :authenticate_user!
end
