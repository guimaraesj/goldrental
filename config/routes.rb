Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :rents, only: %i[show new create edit update]
    collection do
      get :my_products # path for my products. no id required for my products since I have current_user logged in
    end
  end
  resources :rents, only: %i[index destroy] do
    resources :reviews, only: %i[new create]
    member do
      patch :approved
      patch :declined
    end
  end
end
