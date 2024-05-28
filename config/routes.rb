Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  resources :celebrities, only: [:index, :new, :show, :create, :update, :destroy] do
<<<<<<< HEAD
=

=======
    resources :bookings, only: [:create, :new]
>>>>>>> 9df7944782858fbf6f4579e001b226441924402f
  end
end
