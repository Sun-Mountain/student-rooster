# frozen_string_literal: true

module Auth
  class SessionsController < Devise::SessionsController
    before_action :find_user, only: %i[create destroy]
    skip_before_action :authenticate_user, only: :create
    respond_to :json

    private
    
    def find_user
      @user = User.find_by(email: params[:email])
    end

    def respond_with(resource, _opts = {})
      if request.method == 'POST' && resource
        if @user.valid_password?(params[:password])
          render json: { message: 'You are signed in successfully.' },
                 data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
                 status: :ok
        else
          render json: { message: 'Invalid email or password.' }, status: 401
        end
      else
        render json: { message: 'Hmm nothing happened.' }, status: 503
      end
    end

    def respond_to_on_destroy
      if request.method == 'DELETE' && current_user
        render json: { message: 'You are signed out successfully.' }, status: :ok
      else
        render json: { message: 'Hmm nothing happened.' }, status: 503
      end
    end
  end
end
