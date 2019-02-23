Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  root 'articles#index'
  resources :articles do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end
