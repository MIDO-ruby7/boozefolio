Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'rooms/show'
  root to: 'static_pages#top'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  post '/google_login_api/callback', to: 'google_login_api#callback'
  delete '/google_login_api/logout', to: 'google_login_api#destroy', as: 'logout'

  namespace :items do
    resources :searches, only: %i[index]
    get 'search', to: 'searches#search'
    get 'barcode_search', to: 'searches#barcode_search'
  end

  resources :items, only: %i[index show new create edit update destroy] do
    member do
      get 'new_page', to: 'items#new_page', as: 'new_page'
    end
    resources :drinking_records, only: %i[create] do
      collection do
        get 'new_page/:item_id', to: 'drinking_records#new_page', as: 'new_page'
      end
    end
  end
  resources :user_items, only: %i[index destroy]
  resources :categories, only: %i[index new create edit update destroy] do
    member do
      get 'default_values', to: 'categories#default_alcohol_content'
    end
  end
  resource :users, only: %i[show edit update]
  resources :rooms, only: %i[create]
  resources :stamps, only: %i[index new create destroy]
  resources :message_stamp_relationships, only: %i[create destroy]
end
