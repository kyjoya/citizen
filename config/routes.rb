Rails.application.routes.draw do
  root 'states#index'
  devise_for :users
  resources :users, only: [:show]

  namespace :admin do
      resources :petitions, only: [:index, :destroy]
      resources :users, only: [:edit, :update, :destroy]
  end

  resources :states, only: [:show] do
    resources :petitions
  end

  resources :petitions, only: [:show, :index] do
    resources :memberships, only: [:create, :destroy]
  end
end
