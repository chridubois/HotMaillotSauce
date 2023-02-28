Rails.application.routes.draw do
  devise_for :users
  root to: "jerseys#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources 'jerseys', only: %i[index new create edit update destroy show]
  resources 'orders', only: %i[create update destroy show index]
end
