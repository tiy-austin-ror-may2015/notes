Rails.application.routes.draw do
  resources :courses
  post 'courses/:id/enroll/:employee_id', to: 'courses#enroll', as: :enroll_employee
  resources :employees
  resources :locations
  resources :companies

  root to: 'companies#index'
end
