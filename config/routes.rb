Rails.application.routes.draw do
  resources :tracks
  resources :projects
  # devise routes for authentication
  devise_for :users

  root "projects#index"
end
