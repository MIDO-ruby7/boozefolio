Rails.application.routes.draw do
  get 'google_login_api/callback'
  root to: 'static_pages#top'
  get '/guide', to: 'static_pages#guide'
  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
end
