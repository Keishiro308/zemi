Rails.application.routes.draw do
  get 'events/index' => 'member/events#index'
  get 'events/date' => 'member/events#date'
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
    resources :events, only: [:edit, :update, :new, :destroy, :create]
    root 'home#index'
  end
  
end
