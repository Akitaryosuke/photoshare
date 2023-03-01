Rails.application.routes.draw do
  
  root to: "post#index"
  
  resources :post, only: [:new, :index, :create]
  post "posts/upload_image", to: "posts#upload_image"
  
end
