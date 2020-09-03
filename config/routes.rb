Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "layouts#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users do
    resources :questions, except: [:index, :edit, :update] do
      resources :comments, only: [:create]
    end
  end
  resources :tags, only: [:show]

  mount ActionCable.server => '/cable'
end
