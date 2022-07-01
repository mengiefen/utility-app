Rails.application.routes.draw do
  devise_for :users

  root to: "utilities#index"

  resources :users do 
    resources :utilities, only: [:index, :new, :create, :show]
    resources :payments, only: [:index, :show, :new, :create]
  end
  
  get '/home',to: 'homes#home' 
end
