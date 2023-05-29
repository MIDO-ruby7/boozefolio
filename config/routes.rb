Rails.application.routes.draw do
  get 'items/new'
  get 'items/index'
  root to: 'static_pages#top'
  get '/guide', to: 'static_pages#guide'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  post '/google_login_api/callback', to: 'google_login_api#callback'
end
