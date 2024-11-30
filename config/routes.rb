Rails.application.routes.draw do
  resources :communities
  resources :submissions
  devise_for :users
  root "submissions#index"

  get "/pepito", to: "submissions#mostrar"
end
