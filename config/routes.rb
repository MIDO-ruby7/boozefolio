Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/guide', to: 'static_pages#guide'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  post '/google_login_api/callback', to: 'google_login_api#callback'

  namespace :items do
    resources :searches, only: %i[index], defaults: { format: :json }
    get 'search', to: 'searches#search'
  end

  resources :items, only: %i[index show new create edit update destroy] do
    member do
      get 'new_page', to: 'items#new_page', as: 'new_page'
    end
  end

  resources :categories, only: %i[index new create edit update destroy] do
    member do
      get 'default_values', to: 'categories#default_alcohol_content'
    end
  end
end
