# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    before_action :authenticate_user!

  end
end
