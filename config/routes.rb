Rails.application.routes.draw do
  root 'front#index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :users, only: [:new, :create]
  resources :tasks, only: [:index, :create, :update, :edit]
  resources :task_lists, except: [:index, :show] do
    resources :tasks, only: [:new]
  end
end
