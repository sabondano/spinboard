Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup-or-login', to: 'static_pages#signup_or_login'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links
  resources :recommendations, only: [:new, :create]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end

end
