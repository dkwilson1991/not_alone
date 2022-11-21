Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :camps, only: %i[index show create edit update]

  resources :assignments, only: %i[index create update]
end
