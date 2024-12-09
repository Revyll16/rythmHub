Rails.application.routes.draw do
  get 'compositions/create'
  get 'compositions/index'

  root 'pages#home'

  # Musicians Routes
  resources :musicians, only: [:index, :show, :new, :create, :edit, :update] do
    resources :compositions, only: [:create, :new]
    # resources :forums, only: [:index]
  end

  resources :compositions, only: [ :show, :edit, :update] do
  end

  resources :compositions, only: [:index, :show] do
    resources :feedbacks, only: [:index, :create, :new]
  end

  resources :forums, only: [:index, :show, :create, :new] do
    resources :posts, only: [:create, :index]
  end

  resources :compositions do
    resources :feedbacks, only: [:create]
  end

  resources :instruments, only: [:index, :show, :create]

  # User Authentication Routes (Devise or custom user authentication)
  devise_for :users
end
