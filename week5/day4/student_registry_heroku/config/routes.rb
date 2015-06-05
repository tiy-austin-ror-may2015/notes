Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'students/highest_gpa', to: 'students#highest_gpa'
  get 'students/most_common_name', to: 'students#most_common_name'
  get 'students/new_additions', to: 'students#new_additions'

  get    'students/:id', to: 'students#show'
  put    'students/:id', to: 'students#update'
  delete 'students/:id', to: 'students#destroy'

  get  'students',  to: 'students#index'
  post 'students',  to: 'students#create'

  root 'students#index'

  match '*not_found_route', to: 'application#skip_cors', via: [:get, :post, :put, :delete]

end
