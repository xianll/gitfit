Rails.application.routes.draw do
  root 'profiles#index'
  devise_for :users
  resources :profiles
  resources :products
  resources :charges
  get '/users/:id', to: 'users#account'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
