Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:create]
  resources :students, only: [:index, :create] do
    resources :moves, only: [:index, :create]
  end
  resources :puzzles, only: [:index, :create]

  # User Auth routes
  post 'user_token' => 'user_token#create'
  get '/users' => 'users#show'

end
