Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/sign_up', to: 'users#new', as: :sign_up  
end
