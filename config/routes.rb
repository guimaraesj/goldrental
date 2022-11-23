Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :rents, only: %i[show new create edit update]
  end
  resources :rents, only: %i[index destroy] do
    resources :reviews, only: %i[new create]
    # falta validar todas as rotas
  end
end
