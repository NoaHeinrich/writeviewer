Rails.application.routes.draw do
  root "sessions#new"
  resources :users, except: :index
  resources :videos do
    resources :descriptions, except: [:index, :show]
  end


  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get 'logout' => 'sessions#destroy'
end
