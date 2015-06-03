Rails.application.routes.draw do
  get  'tweets', to: 'tweets#index'
  post 'tweets', to: 'tweets#create'

  get 'tweets/new', to: 'tweets#new'
  get 'tweets/edit', to: 'tweets#edit'

  get    'tweets/:id', to: 'tweets#show'
  put    'tweets/:id', to: 'tweets#update'
  delete 'tweets/:id', to: 'tweets#destroy'
end
