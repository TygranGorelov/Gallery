Rails.application.routes.draw do

  devise_for :users

  root 'main#index'

  resources :users

  resources :categories, only: %i[create destroy show index] do
    resources :pictures, only: %i[create destroy show] do
      post :like, as: 'like'
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  get :pictures, to: 'pictures#index'
  post :pictures, to: 'pictures#create'

  get :comments, to: 'comments#index'


end
