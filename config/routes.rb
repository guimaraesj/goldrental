Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :rentals, only: %i[new create edit update]
  end
  resources :rentals, only: %i[index destroy] do
    resources :reviews, only: %i[new create]
  end
end
