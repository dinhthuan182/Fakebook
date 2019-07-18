Rails.application.routes.draw do
  root to: "home_page#feeds"

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
  get 'discovers', to: 'home_page#discovers'

end
