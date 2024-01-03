Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'static_pages/home'
  resources :posts do
    resources :comments
  end
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token

  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
end
