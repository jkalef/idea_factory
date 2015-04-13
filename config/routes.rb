Rails.application.routes.draw do

  devise_for :users
  root "ideas#index"

  resources :ideas, only: [:index, :create, :new, :show] do
    resources :comments, only: [:create]
    resources :joins, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

end
