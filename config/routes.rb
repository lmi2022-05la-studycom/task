Rails.application.routes.draw do
  root to: 'users#show'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
end
