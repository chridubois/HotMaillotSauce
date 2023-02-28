Rails.application.routes.draw do
  get 'jerseys/edit'
  get 'jerseys/update'
  get 'jerseys/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources 'jerseys', only: %i[index edit update destroy]
end
