Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, path: 'u/'

  resources :teams, path: 't/', only: [:create, :edit, :update] do
    resources :lessons, path: 'L', only: [:create, :edit, :update, :show, :destroy]
  end

  resources :students, only: [:index, :create, :edit, :show, :update, :destroy]

  authenticated :user do
    root 'portal#show', as: :authenticated_root, via: :get
  end

  root to: 'public#landing'
end
