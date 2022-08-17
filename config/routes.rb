Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  get 'tasks/new'
  get 'tasks/edit'
  root to: 'users#show' #ログイン必要

  get 'users/show/:status', to: 'users#show', as: :users_show

  delete 'users/destroy_all', to: 'users#destroy_all', as: :users_destroy_all
  # get 'users/destroy/:status', to: 'users#destroy', as: :users_destroy

  # resources :users do
  #   resources :tasks, only: [] do
  #     collection do
  #       delete '', action: :destroy_all
  #     end
  #   end
  # end

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' #ログイン必要
  
  resources :users
  resources :tasks 
end