Muzik::Application.routes.draw do
  resources :releases

  resources :recordings

  root to: "home#index"

  devise_for :users
end