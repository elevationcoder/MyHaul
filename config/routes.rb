Rails.application.routes.draw do
  resources :drivers do
    resources :reviews, except: [:show], shallow: true
  end

  resources :offers, only: [:show, :update] 
  
    
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/users/register', to: 'users#new' 
  post '/users', to: 'users#create'

  get '/drivers/signup', to: 'drivers#new'
  post '/drivers', to: 'drivers#create'

  get '/drivers/login', to: 'driver_sessions#new'
  post 'drivers/drivers_sessions', to: 'driver_sessions#create'
  post '/logout', to: 'driver_sessions#destroy', as: 'driver_logout'

  get '/users/login', to: 'sessions#new'
  post '/users/sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: 'user_logout'
  resources :users 
  root 'welcome#home'

end
