Rails.application.routes.draw do
  resources :cards, only: [:index]
  resources :boards, only: [:show, :update]
  resources :players, only: [:create]
  resources :games, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "games#new"
end
