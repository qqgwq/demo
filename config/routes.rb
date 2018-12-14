Rails.application.routes.draw do
  root 'welcomes#index'
  get 'mechanic', to: 'welcomes#mechanic'
  get 'qingshen', to: 'welcomes#qingsheng'
  get 'hot', to: 'welcomes#hot'
  get 'about', to: 'welcomes#about'

  get 'nursing', to: 'welcomes#nursing'
end
