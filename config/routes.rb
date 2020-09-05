Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :games, only: [:create]
  resources :game_users, only: [:create]
  resources :game_moves, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
