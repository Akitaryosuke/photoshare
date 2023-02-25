Rails.application.routes.draw do
  
  root to: "post#index"
  
  resources :post, only: [:new, :index, :create]
  
end
