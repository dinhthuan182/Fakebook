Rails.application.routes.draw do
  get     'photos/index'
  get     'albums/index'
  get     'users/index'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  get     '/edit',    to: 'users#edit'

  resources :albums
  resources :photos
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
