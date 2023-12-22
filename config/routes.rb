Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get 'index', to: 'pages#index', as: 'index'
  get 'about', to: 'pages#about', as: 'about'
  get 'reviews', to: 'pages#about', as: 'reviews'


  resources :products
  get 'create_product', to: 'products#new', as: 'create_product'

  post 'buy_product', to: 'buyers#buy_product', as: 'buy_product'

end
