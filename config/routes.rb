Rails.application.routes.draw do  
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
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
  root to: "home#index"
  
end
