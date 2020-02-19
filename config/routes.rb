Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :events, except: [:destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
