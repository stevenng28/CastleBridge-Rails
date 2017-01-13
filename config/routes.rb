Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  get '/home',          to: 'static_pages#home'
  get '/record',        to: 'bridge_status#edit'
  put '/record',        to: 'bridge_status#update'
  
  resources :toggle_notifications, only: [:edit]
  resources :toggle_morning_notifications, only: [:edit]
  resources :suppress_warnings, only: [:edit]
  resources :bridge_statuses, only: [:edit, :update]
end
