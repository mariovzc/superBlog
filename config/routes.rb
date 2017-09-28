Rails.application.routes.draw do

  root "posts#index"

  resources :posts
  get '/user_posts', to: 'posts#user_posts', as: :user_posts

  get '/sign_up', to: 'users#new', as: :sign_up  
  resources :users, only: [:new, :create]


  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out

end
