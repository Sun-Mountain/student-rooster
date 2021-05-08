Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, path: 'lesson/' do
    resources :teams, path: '' do
      resources :lessons, path: ''
    end
  end

  authenticated :user do
    root 'portal#show', as: :authenticated_root, via: :get
    match '/portal', to: 'portal#show', via: :get
  end

  root to: 'public#landing'
end
