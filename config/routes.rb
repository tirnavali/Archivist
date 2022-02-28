Rails.application.routes.draw do  
  resources :organizations
  resources :record_metadata
  resources :record_attachments do
    get 'delete_image_attachment', on: :member
      member do
        delete :delete_image_attachment
      end
  end
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
  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  root to: "home#index"

end
