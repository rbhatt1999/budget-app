Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  resources :categories do
    resources :purchases
  end

  get 'home' => 'home#index'

  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
