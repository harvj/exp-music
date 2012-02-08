Muzik::Application.routes.draw do
  resources :artists

  resources :releases

  resources :recordings

  root to: "releases#index"

  devise_for :users
end