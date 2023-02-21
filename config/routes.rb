Rails.application.routes.draw do
  get 'entity/index'
  get 'entity/new'
  get 'group/index'
  get 'group/new'
  get 'home/index'
  root to: 'home#index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
