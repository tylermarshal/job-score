Rails.application.routes.draw do
  root 'home#index'

  get 'auth/linkedin', as: :linked_login

  get '/auth/linkedin/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :dashboard, only: [:index]
end
