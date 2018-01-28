Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :teachers, only: [:create, :show] do
    resources :students, only: [:index, :show, :create, :update, :destroy]
  end

  # resource: :sessions, only: [create, destroy]

  # User Authorization
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
