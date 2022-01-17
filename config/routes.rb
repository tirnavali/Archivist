Rails.application.routes.draw do
  resources :special_numbers
  resources :special_number_names
  resources :people
  resources :privacies
  resources :toponyms
  resources :document_types
  resources :phisycal_statuses
  resources :subjects
  resources :documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
