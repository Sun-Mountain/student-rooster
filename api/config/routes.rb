# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names:{
                      # confirmation: 'verification',
                      registration: 'signup',
                      sign_in: 'login',
                      sign_out: 'logout'
                    },
                    controllers: {
                      sessions: 'auth/sessions',
                      registrations: 'auth/registrations'
                    }

  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web => '/sidekiq'
    # mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
