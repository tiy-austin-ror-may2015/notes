Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'students/highest_gpa', to: 'students#highest_gpa', as: 'gpa'

  get 'students/most_common_name', to: 'students#most_common_name'
  get 'students/new_additions', to: 'students#new_additions'

  resources :students

  root 'students#index'

end
