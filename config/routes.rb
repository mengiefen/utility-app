Rails.application.routes.draw do
  devise_for :users

  root to: "utilities#index"

  resources :users


  get '/home',to: 'homes#home'
  get '/utilities', to: 'utilities#index', as: 'categories'

end
