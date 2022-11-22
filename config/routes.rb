Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :camps, only: %i[index show edit create update]

  resources :assignments, only: %i[index create update]
end
