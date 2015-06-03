Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get('/students/highest_gpa', {to: 'students#highest_gpa'})

  get('/students/:id', {to: 'students#show' })
  put '/students/:id', to: 'students#update'
  delete 'students/:id', to: 'students#destroy'
  get('/students', { to: 'students#index'  })
  post('/students', { to: 'students#create' })

  root 'students#index'
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
end
