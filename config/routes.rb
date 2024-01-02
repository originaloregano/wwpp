Rails.application.routes.draw do
  resources :posts
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :users
  resources :comments
  resources :sessions

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end

  root "sessions#sign_in"
  post "/sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  post "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
end
