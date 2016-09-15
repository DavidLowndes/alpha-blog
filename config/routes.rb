Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Pages Controller
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  # Articles Controller
  resources :articles
  
  # Users Controller
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
end
