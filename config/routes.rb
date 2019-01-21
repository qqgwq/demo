Rails.application.routes.draw do
  root 'welcomes#index'
  get 'mechanic', to: 'welcomes#mechanic'
  get 'qingshen', to: 'welcomes#qingsheng'
  get 'hot', to: 'welcomes#hot'
  get 'about', to: 'welcomes#about'

  get 'nursing', to: 'welcomes#nursing'
  get 'preschool', to: 'welcomes#preschool'
  get 'train', to: 'welcomes#train'
  get 'computer', to: 'welcomes#computer'

  get 'information', to: 'eductions#information'
  get 'info', to: 'eductions#info'
  get 'school', to: 'eductions#school'
  get 'dog', to: 'eductions#dog'
end
