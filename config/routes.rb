Rails.application.routes.draw do
  # devise routes for authentication
  devise_for :users

  root "hello#index"
end
