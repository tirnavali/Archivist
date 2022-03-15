Rails.application.routes.draw do  
  resources :organizations
  resources :record_metadata do
    collection do
      match 'search' => 'record_metadata#search', via: [:get, :post], as: :search
    end
  end
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
  resources :people do
    collection do
      get :search
    end
  end
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
  
  namespace :admin do
    resources :users do
      member do
        get :activities
      end
    end
    #resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  root to: "home#index"

end
