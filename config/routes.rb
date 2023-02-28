Rails.application.routes.draw do
  get 'orders/create'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/show'
  get 'orders/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources 'jerseys', only: %i[new create edit update destroy show]
end
