Rails.application.routes.draw do
  devise_for :users
  root 'site#index', as: :root

  resources :dashboard, only: :index
  get 'dashboard/search'

  resources :artist, only: :show
  resources :tracks

  post '/create_history_item', to: 'play_history#create_history_item'
end
