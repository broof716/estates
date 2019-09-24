Rails.application.routes.draw do
  devise_for :users
  resource :reviews, only: [:show]
  root 'estates#index'
  resources :estates do
    resources :comments, only: :create
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
