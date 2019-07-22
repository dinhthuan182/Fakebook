Rails.application.routes.draw do
  resources :albums
  get 'users/show'
  get 'home_page/index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :photos
  # root to: "home_page#index"
  root to: "photos#index"

end
