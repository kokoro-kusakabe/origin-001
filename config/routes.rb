Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: "tweets#index"

  resources :users, only: [:new, :show] do
    member do
      get :following, :followers
    end
  end

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end

  resources :messages, only: :create
  resources :rooms, only: [:create, :show]
  resources :relationships, only: [:create, :destroy]

  resources :categories, only: :show
end
