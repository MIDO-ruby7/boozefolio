Rails.application.routes.draw do
  root to: 'static_pages#top'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  post '/google_login_api/callback', to: 'google_login_api#callback'
  delete '/google_login_api/logout', to: 'google_login_api#destroy', as: 'logout'


  namespace :items do
    resources :searches, only: %i[index]
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
