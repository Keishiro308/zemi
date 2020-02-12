Rails.application.routes.draw do
  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :bookmarks, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :member do
    resources :posts
    resources :users, only: [:index, :update, :show]
    root 'home#index'
  end
  
end
