Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]
  resources :papers, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :posts, only: [:new, :create]
  end
  resource :profile, only: [:edit, :update]
  resources :labs, only: [:show, :new, :create, :edit, :update] do
    patch :archive
  end

  resources :participants, only: [:new, :create] do
    member do
      patch :accept
      patch :deny
      patch :cancel
    end
  end
  resources :posts, only: [:new, :create]
  resources :authors, only: [] do
    member do
      patch :confirm_authorship
    end
  end
end
