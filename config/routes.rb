Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:create, :show]
  resources :students, only: [:index, :show, :create, :update, :destroy] do
    resources :moves, only: [:index, :show, :create, :update, :destroy]
  end
  resources :puzzles, only: [:index, :show]

  post 'user_token' => 'user_token#create'

  # User Authorization
  get '/signup' => 'users#new'
  get '/users' => 'users#show'

end
