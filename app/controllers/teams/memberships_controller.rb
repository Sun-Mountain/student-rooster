# frozen_string_literal: true

module Teams
  class MembershipsController < ApplicationController
    before_action :authenticate_user!
  end
end
