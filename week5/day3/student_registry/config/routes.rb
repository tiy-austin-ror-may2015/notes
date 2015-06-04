Rails.application.routes.draw do
  get '/students/highest_gpa', to: 'students#highest_gpa'

  get    'students/:id', to: 'students#show'
  put    'students/:id', to: 'students#update'
  delete 'students/:id', to: 'students#destroy'

  get    'students',  to: 'students#index'
  post   'students',  to: 'students#create'

  root 'students#index'
end
