Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#index'

  root "welcome#index"

  resources :users
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :destroy, :index]
  get '/login', to: 'sessions#new'
  post '/add-ul/:id', to: 'places#add', as: 'add_ul'

end
