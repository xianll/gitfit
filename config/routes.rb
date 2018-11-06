Rails.application.routes.draw do
  root 'profiles#index'
  devise_for :users
  resources :profiles
  resources :products
  post '/charges', to: 'user#account'
  resources :charges
  get '/user/:id', to: 'user#account'
  get '/user/:id/myproducts', to: 'user#myproducts'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
