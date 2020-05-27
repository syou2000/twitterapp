Rails.application.routes.draw do

  authenticated :user do
    root to: 'tweets#index', as: :user_root
  end

  root 'tweets#explore'

  get 'explore', to: 'tweets#explore'

  resources :tweets, only: [:new, :create]
  resources :users, only: [:edit]
  resources :relationships, only: [:index, :show, :create, :destroy]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy" 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
