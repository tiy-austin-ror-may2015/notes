Rails.application.routes.draw do
  resources :comments
  resources :posts
  root 'application#index'
end
