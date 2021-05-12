Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :users, path: 'u/' do
    resources :teams, path: 't/' do
      resources :lessons, path: 'l/' do
        resources :rosters, path: 'r/'
      end
      resources :students, path: 'st/'
    end
  end

  resources :teams, path: 'team/', only: [:edit, :update]

  match '/students', to: 'students#index', via: :get

  authenticated :user do
    root 'portal#show', as: :authenticated_root, via: :get
    match '/portal', to: 'portal#show', via: :get
  end

  root to: 'public#landing'
end
