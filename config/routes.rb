Rails.application.routes.draw do

  get "about", to: "homes#about"

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
    }
  devise_scope :user do
    get "/", to: "users#index", :as => "user_authenticated_root"
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_scope :admin do
    get "/", to: "admins#index", :as => "admin_authenticated_root"
    get "sign_in", :to => "admins/sessions#new"
    get "sign_out", :to => "admins/sessions#destroy"
  end

  resources :users
  resources :reviews
  resources :admins, only: [:index]
  resources :shops, only: [:index, :new, :create, :edit, :update, :destroy]

end
