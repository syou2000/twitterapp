Rails.application.routes.draw do
  get 'tweets/index'
  devise_for :users
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    post "signup", :to => "users/registrations#create"
    get "login", :to => "users/sessions#new"
    post "login", :to => "users/sessions#create"
    delete "logout", :to => "users/sessions#destroy"
  end
  root 'tweets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
