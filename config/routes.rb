Rails.application.routes.draw do
  

  resources :offers, shallow: true 
  
    
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


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
  
  get '/auth/facebook/callback', to: 'sessions#create'
  resources :users
  resources :drivers, shallow: true do
    resources :reviews, shallow: true
  end

   
  
  root 'welcome#home'

end
