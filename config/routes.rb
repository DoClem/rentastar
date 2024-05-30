Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :celebrities, only: [:index, :new, :show, :create, :update, :destroy] do
    resources :bookings, only: [:new, :create, :update]
  end
  resources :bookings, only: [:index, :show, :destroy]
end
