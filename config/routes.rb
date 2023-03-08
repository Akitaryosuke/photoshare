Rails.application.routes.draw do
  
  devise_for :users
  root to: "post#index"
  
  resources :post, only: [:new, :index, :create]
end
