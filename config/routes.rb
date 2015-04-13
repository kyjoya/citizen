Rails.application.routes.draw do
  root 'states#index'
  devise_for :users

  resources :states, only: [:show] do
    resources :petitions, only: [:index]
  end
end
