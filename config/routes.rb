Rails.application.routes.draw do
  devise_for :users
  # rubocop:disable Style/SymbolArray
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:new, :create, :update, :destroy] do
    resources :comments
    resources :likes
  end
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
  root to: 'users#index'
end