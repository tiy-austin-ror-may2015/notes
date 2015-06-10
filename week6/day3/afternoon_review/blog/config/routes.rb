Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about', as: 'about'
  get 'category/:name', to: 'welcome#category', as: 'category'

  resources :posts
  resources :comments

  root 'welcome#index'
end
