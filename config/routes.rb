Rails.application.routes.draw do
  root 'profiles#home'
  devise_for :users
  resources :profiles
  resources :products
  post '/charges', to: 'charges#create'
  resources :charges
  get '/user/:id', to: 'user#index'
  get '/user/:id/myproducts', to: 'user#myproducts'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
