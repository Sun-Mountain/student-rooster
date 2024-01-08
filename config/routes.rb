# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  match '/style', to: 'public#style-guide', via: :get

  root "public#landing"
end
