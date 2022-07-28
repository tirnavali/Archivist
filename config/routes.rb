Rails.application.routes.draw do  
  resources :organizations
  resources :languages
  resources :record_metadata do
    collection do
      match 'search' => 'record_metadata#search', via: [:get, :post], as: :search
    end
    member do
      get :audit
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
        get :record_submissions
      end
    end
    #resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  resources :record_submissions, only: [:index]
  root to: "home#index"
  get "/basic_search", to: "home#basic_search"
  get "/search_clues", to: "home#search_clues"

end
