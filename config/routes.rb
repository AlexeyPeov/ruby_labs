Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  #get 'edit_home_path', to:  'home#edit', as: 'edit_home'


  # zaglushki
  get 'index', to: 'pages#index', as: 'index'
  get 'about', to: 'pages#about', as: 'about'
  get 'reviews', to: 'pages#about', as: 'reviews'


  resources :products

  resources :buyers
  get 'show_buyer', to: 'buyers#show', as: 'show_buyer'

  resources :sellers
  get 'show_seller', to: 'sellers#show', as: 'show_seller'



  get 'create_product', to: 'products#new', as: 'create_product'

  post 'buy_product', to: 'buyers#buy_product', as: 'buy_product'

  #put 'edit_product', to: 'products#edit', as: 'edit_product'

end
