Rails.application.routes.draw do
  root to: 'causes#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :causes do
    resources :donations, only: [:new, :create]
  end
end
