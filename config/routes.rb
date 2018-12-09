Rails.application.routes.draw do
  mount ApplicationRoot => '/'
  root 'products#index'
  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      post :clean
    end
  end
  resources :users
  resources :orders
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  post 'login', to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
