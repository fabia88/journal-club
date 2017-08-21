Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resource :dashboard, only: :show do
      post :import_papers
    end
  end
  resources :users, only: [:index, :show]

  resources :papers, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resource :profile, only: [:edit, :update]

  resources :labs, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      patch :archive
    end
    resources :memberships, only: [:new, :create]
    resources :posts, only: [:new, :create]
    resources :paper, only: [] do
      resources :posts, only: [:new, :create]
    end
  end

  resources :memberships, only: [] do
    member do
      patch :accept
      patch :deny
      patch :cancel
    end
  end

  resources :authors, only: [] do
    member do
      patch :confirm_authorship
    end
  end
end
