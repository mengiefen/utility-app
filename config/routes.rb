Rails.application.routes.draw do
  devise_for :users

  root to: "users#index"

  resources :users


  get '/home',to: 'homes#home'

end
