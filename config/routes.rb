Rails.application.routes.draw do
  
  resources :attractions, :rides, :users, :sessions

  get '/signin', to: 'sessions#new'

  delete '/signout', to: 'sessions#destroy'

  root to: "sessions#splash"
end
