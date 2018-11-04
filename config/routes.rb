Rails.application.routes.draw do
  root 'profiles#index'
  resources :profiles
  resources :products
  devise_for :users, controllers: {
    :sessions => "users/sessions",
    :registrations => "users/registrations" }
  resources :charges
  get '/users/:id', to: 'users#account'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
