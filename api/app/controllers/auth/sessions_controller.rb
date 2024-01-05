# frozen_string_literal: true

module Auth
  class SessionsController < Devise::SessionsController
    before_action :find_user
    skip_before_action :authenticate_user
    respond_to :json

    private
    
    def find_user
      @user = User.find_by(email: session_params[:email])
    end

    def respond_with(resource, _opts = {})
      if request.method == 'POST' && resource
        if @user.valid_password?(session_params[:password])
          render json: {
            message: 'You are signed in successfully.',
            body: {
              user: @user,
            }
          },
          status: :ok
        else
          render json: { message: 'Invalid email or password.' }, status: 401
        end
      else
        render json: { message: 'Hmm nothing happened.' }, status: 503
      end
    end

    def respond_to_on_destroy
      @user = User.find_by(email: session_params[:email])
      if request.method == 'DELETE' && @user.present?
        render json: { message: 'You are signed out successfully.' }, status: :ok
      else
        render json: { message: 'Hmm nothing happened.' }, status: 503
      end
    end

    def session_params
      params.require(:user).permit(:email, :password, :token, :id, :username, :jti, :role, :created_at, :updated_at)
    end
  end
end
