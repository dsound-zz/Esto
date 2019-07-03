Rails.application.routes.draw do
  resources :phones
  resources :images
  resources :invoices
  resources :contacts
  resources :project_images
  resources :projects
  resources :employees
  resources :addresses
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
