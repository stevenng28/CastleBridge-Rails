Rails.application.routes.draw do
  
  get 'static_pages/home'

  get 'static_pages/notify'
  
  get '/home',      to: 'static_pages#home'
  get '/notify',    to: 'static_pages#notify'
  
  root 'static_pages#home'

  resources :users
  
end
