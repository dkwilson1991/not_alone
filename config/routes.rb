Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :camps, only: %i[index show create edit update]
  resources :assignments, only: %i[index create update]
end
