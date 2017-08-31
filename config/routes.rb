Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bars, only: [:index, :show, :create, :update]
  resources :events, only: [:index, :show, :create, :update]
end

