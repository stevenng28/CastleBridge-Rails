Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get 'static_pages/notify'
  
  get '/home',          to: 'static_pages#home'
  get '/sendclosed',    to: 'static_pages#sendclosed'
  get '/sendopen',      to: 'static_pages#sendopen'

  resources :toggle_notifications, only: [:edit]
  
end
