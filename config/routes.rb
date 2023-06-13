Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/edit'
  root to: 'static_pages#top'
  get '/guide', to: 'static_pages#guide'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  post '/google_login_api/callback', to: 'google_login_api#callback'
  resources :items, only: %i[index show new create edit update destroy]
  resources :categories, only: %i[index new create edit update destroy]
end
