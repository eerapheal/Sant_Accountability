Rails.application.routes.draw do
 
  devise_for :users
 
  resources :groups, only: [:index, :show, :new, :create] 
  resources :users

  root "application#index"
end
