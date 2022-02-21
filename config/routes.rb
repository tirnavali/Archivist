Rails.application.routes.draw do  
  resources :number_types
  resources :vacations
  resources :fonds do
    resources :documents  do
      get 'delete_image_attachment', on: :member
      member do
        delete :delete_image_attachment
      end
    end
  end
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
  resources :documents do
    get 'delete_image_attachment', on: :member
      member do
        delete :delete_image_attachment
      end
  end
  # resources :documents, except: [:new, :create]  do
       
  #   get 'delete_image_attachment', on: :member
  #   member do
  #     delete :delete_image_attachment
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"
  
end
