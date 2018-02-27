Rails.application.routes.draw do
  root 'home#index'

  get 'auth/linkedin', as: :linkedin_login

  get '/auth/linkedin/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'

  resources :dashboard, only: [:index]

  resources :resumes, only: [:create]
  resources :cover_letters, only: [:create]
  resources :jobs, only: [:create]

  get "/resume-analysis", to: "resume_analysis#show"
  get "/cover-letter-analysis", to: "cover_letter_analysis#show"

end
