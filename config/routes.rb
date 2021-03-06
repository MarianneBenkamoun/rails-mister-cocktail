Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :new, :show, :create, :destroy] do
    resources :doses, only: [ :new, :create ]
    resources :reviews, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy]
end
