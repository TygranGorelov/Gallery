Rails.application.routes.draw do

  devise_for :users

  root 'main#index'

  resources :users

  resources :categories, only: %i[create destroy show index] do
    post :subscribe, to: 'categories#subscribe'
    delete :subscribe, to: 'categories#unsubscribe'
    resources :pictures, only: %i[create destroy show] do
      post :like, as: 'like'
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create] do
        collection do
          delete :destroy, to: 'likes#destroy'
        end
      end
    end
  end

  get :pictures, to: 'pictures#index'
  post :pictures, to: 'pictures#create'

  get :comments, to: 'comments#index'

  

end
