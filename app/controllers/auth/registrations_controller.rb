# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :authenticate_user
    respond_to :json

    private

    def register_user(resource)
      if resource.save
        render json: { message: 'You are signed up successfully.' },
               data: UserSerializer.new(resource).serializable_hash[:data][:attributes],
               status: :ok
      else
        render json: resource.errors, status: :unprocessable_entity
      end
    end

    def respond_with(resource, _opts = {})
      if request.method == 'POST' && resource
        register_user(resource)
      else
        render json: { message: 'Hmm nothing happened.' }, status: 503
      end
    end
  end
end
