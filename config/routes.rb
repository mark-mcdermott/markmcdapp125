Rails.application.routes.draw do

  resources :users

  root 'home#index'

  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  get    '/signup',   to: 'users#new'
  post   '/signup',   to: 'users#create'
  get    '/about',    to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'

end
