Rails.application.routes.draw do
  root to: "home_page#discovers"

  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    member do
      get :followings, :followers
    end
  end

  resources :albums do
    resources :likes, only: [:create, :destroy], module: :albums
    member do
      delete :delete_image_attachment
    end
  end

  resources :photos do
    resources :likes, only: [:create, :destroy], module: :photos
  end

  resources :relationships,       only: [:create, :destroy]
  get 'feeds', to: 'home_page#feeds'

end
