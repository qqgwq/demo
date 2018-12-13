Rails.application.routes.draw do
  root 'welcomes#index'
  get 'mechanic', to: 'welcomes#mechanic'
  get 'city', to: 'welcomes#city'
  get 'about', to: 'welcomes#about'
  resources :users
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  post 'login', to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
