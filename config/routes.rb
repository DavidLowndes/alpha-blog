Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Pages Routes
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'deletewebsite', to: 'pages#deletewebsite'
  get 'mememode', to: 'pages#mememode'
  
  #Sessions Routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Articles Routes
  resources :articles
  
  # Users Routes
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  #Categories Routes
  resources :categories, except: [:destroy]
  
end
