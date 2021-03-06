Rails.application.routes.draw do


  get 'bookings/calendar', to: 'bookings#calendar', as: 'calendar'
  get 'bookings/mybookings', to: 'bookings#mybookings', as: 'mybookings'
  get 'qrcodes/sendqr', to: 'qrcodes#sendqr', as: 'sendqr'

  resources :bookings, :except => [:edit, :update, :show]
  resources :qrcodes
  devise_for :users, :controllers => {registrations: 'users/registrations'}, :path_prefix => 'my'
  resources :users

  resources :complaints do
    resources :comments
  end

  root 'welcome#index'
  get '*path', to: 'welcome#index'
end
