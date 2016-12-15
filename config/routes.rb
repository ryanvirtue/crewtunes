Rails.application.routes.draw do
  devise_for :users
  root 'site#index', as: :root

  resources :dashboard
  get 'dashboard/search'

  resources :artist, only: :show

end
