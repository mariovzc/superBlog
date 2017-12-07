Rails.application.routes.draw do

  root "posts#index"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get '/user_posts', to: 'posts#user_posts', as: :user_posts

  get '/sign_up', to: 'users#new', as: :sign_up  
  get '/users', to: 'users#new', as: :users  
  
  resources :users, only: [:new, :create]


  resources :sessions, only: [:new, :create, :destroy]
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/log_out', to: 'sessions#destroy', as: :log_out

end
