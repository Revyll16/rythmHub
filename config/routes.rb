Rails.application.routes.draw do
  get 'compositions/create'
  get 'compositions/index'
  
  root 'pages#home'

  # Musicians Routes
  resources :musicians, only: [:index, :show, :new, :create, :edit, :update] do

    resources :compositions, only: [:create, :index]
    # resources :forums, only: [:index]
  end

  resources :compositions, only: [:index, :show] do
    resources :feedbacks, only: [:index, :create]
  end

  resources :forums, only: [:index, :show, :create] do
    resources :posts, only: [:create, :index]
  end

  resources :instruments, only: [:index, :show, :create]

  # User Authentication Routes (Devise or custom user authentication)
  devise_for :users
end
