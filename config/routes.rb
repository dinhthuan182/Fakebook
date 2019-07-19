Rails.application.routes.draw do
  root to: "home_page#discovers"

  get '/feeds', to: "home_page#feeds"

  get '/admin', to: "admin#index"
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    member do
      get :followings, :followers
    end
  end

  resources :albums do
    member do
      delete :delete_image_attachment
    end
  end

  resources :photos
  resources :relationships,       only: [:create, :destroy]


end
