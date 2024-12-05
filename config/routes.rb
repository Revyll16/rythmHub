Rails.application.routes.draw do
  get 'pages/home'
  # Root route (Landing page)
  root 'pages#home'

  # Musicians Routes
  resources :musicians, only: [:index, :show, :new, :create, :edit, :update] do
    resources :compositions, only: [:create, :index, :new]
    # resources :forums, only: [:index]
  end

  # Compositions Routes
  resources :compositions, only: [:index, :show, :edit, :update] do
    resources :feedbacks, only: [:index, :create]
  end

  # Forum Routes
  resources :forums, only: [:index, :show, :create] do
    # Nested posts within forums
    resources :posts, only: [:create, :index]
  end

  # Instruments Routes (May or may not be necessary if handled by musician profiles)
  resources :instruments, only: [:index, :show, :create]

  # User Authentication Routes (Devise or custom user authentication)
  devise_for :users
end
