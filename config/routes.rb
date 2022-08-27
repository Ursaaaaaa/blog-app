Rails.application.routes.draw do
  devise_for :users
  # rubocop:disable Style/SymbolArray
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :comments, only: [:new, :create, :destroy]
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/sign_in' => 'users#login'
      get 'posts' => 'posts#index'
      get 'comments' => 'comments#index'
      post 'comments/create' => 'comments#create'
    end
  end
  root to: 'users#index'
end