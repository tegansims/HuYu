Rails.application.routes.draw do
  root 'welcome#home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/players/:id/card_pick_form', to: 'players#card_pick_form', as: :card_pick
  patch '/players/:id/card_pick_form', to: 'players#card_pick_save'

  get '/celebration', to: 'games#celebration'

  resources :cards, only: [:index]
  resources :boards, only: [:show, :update]
  resources :players, only: [:new, :create]
  resources :games, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
