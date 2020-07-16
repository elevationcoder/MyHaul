Rails.application.routes.draw do
  

  get 'messages/index'
  get 'messages/show'
  get 'conversations/index'
  resources :offers, shallow: true 
  
  resources :conversations do
    resources :messages
  end
    
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/auth/facebook/callback', to: 'sessions#create'

  get '/users/register', to: 'users#new' 
  post '/users', to: 'users#create'

  get '/drivers/signup', to: 'drivers#new'
  post '/drivers', to: 'drivers#create'

  
  get '/drivers/login', to: 'driver_sessions#new'
  post '/drivers/driver_sessions', to: 'driver_sessions#create'
  post '/logout', to: 'driver_sessions#destroy', as: 'driver_logout'
  
  get '/users/login', to: 'sessions#new'
  post '/users/sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'user_logout'
  
  resources :users
  resources :drivers, shallow: true do
    resources :reviews, shallow: true
  end

   
  
  root 'welcome#home'

end
