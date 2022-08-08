Rails.application.routes.draw do
  root to: 'users#show' #ログイン必要

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' #ログイン必要
  
end
