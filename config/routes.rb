Rails.application.routes.draw do
  root "sessions#new"
  resources :users, except: :index
  resources :videos
  resources :descriptions, except: :index

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get 'logout' => 'sessions#destroy'
end
