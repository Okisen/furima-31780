Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :destroy] do
    resources :trades, only: :index
  end
end
