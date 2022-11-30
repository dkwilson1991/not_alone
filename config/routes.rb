Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :camps, only: %i[index show edit create update] do
    resources :assignments, only: [:create]
    resources :comments, only: [:create]
  end
  resources :assignments, only: %i[index update show destroy]
  resources :comments, only: [:destroy]
end
