# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login', 
                sign_out: 'logout',
                password: 'secret',
                confirmation: 'verification',
                unlock: 'unblock', 
                registration: 'register',
                sign_up: ''
              }

  authenticated :user do
    root 'dashboard#index', as: :authenticated_root, via: :get
  end

  resources :admin, only: [:index]
  resources :teams
  resources :team_ownerships
  
  get 'up' => 'rails/health#show', as: :rails_health_check

  match '/style', to: 'public#style-guide', via: :get
  match '/dashboard', to: 'dashboard#index', via: :get

  root "public#landing"

  if Rails.env.development?
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
