Rails.application.routes.draw do
  root 'home#index'

  get 'auth/linkedin', as: :linkedin_login

  get '/auth/linkedin/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :dashboard, only: [:index]

  resources :resumes, only: [:create]
  resources :cover_letters, only: [:create]
  resources :jobs, only: [:create]

9end
