Rails.application.routes.draw do
  resources :albums do
    member do
      delete :delete_image_attachment
    end
  end
  get 'users/show'
  get 'home_page/index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :photos
  resources :relationships,       only: [:create, :destroy]

  root to: "home_page#index"

end
