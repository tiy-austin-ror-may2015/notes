Rails.application.routes.draw do
  get 'sessions/new'

  resources :wits
  resources :users

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create', as: 'create_session'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  root 'wits#index'
end
