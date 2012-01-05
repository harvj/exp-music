Muzik::Application.routes.draw do
  resources :recordings

  root to: "home#index"

  devise_for :users
end