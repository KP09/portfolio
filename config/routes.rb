Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'pages#home' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :edit, :update]

  resources :projects do
    resources :participations, only: [:create, :destroy]
    resources :contributions, only: [:index]
  end

  resources :participations, only: [] do
    resources :contributions, only: [:create, :update, :destroy]
  end
end
