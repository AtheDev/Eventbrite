Rails.application.routes.draw do

  get 'pictures/create'
  devise_for :users
  root :to => "events#index"

  resources :events do
    resources :attendances, only: [:new, :create, :index]
    resources :pictures, only: [:create]
  end

  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end

end
