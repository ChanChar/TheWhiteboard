Rails.application.routes.draw do
  root to: 'static_pages#root'
  # root to: 'users#new'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout

  resources :users, only: [:create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :problem_sets, only: [:index, :show]
    resources :questions, only: [:index, :show]
    resources :answers, only: [:show]
    resources :hints, only: [:show]
  end
end
