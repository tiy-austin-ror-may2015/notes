Rails.application.routes.draw do

  get '/users', to: 'users#index'
  # When a GET request comes to the URL /users then send that to
  # The index action of the users controller.
  get '/users/:id', to: 'users#show'
end
