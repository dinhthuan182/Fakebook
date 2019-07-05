Rails.application.routes.draw do
  get     'photos/index'
  get     'albums/index'
  post    'albums/update'
  get     'users/index'
  delete     'pictures/destroy'
  get     '/signup',  to: 'users#new'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  post     '/edit',    to: 'users#edit'
  resources :albums
  resources :photos
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "albums#index"
  delete 'picture/:id' => 'pictures#destroy', as: 'picture'
end
