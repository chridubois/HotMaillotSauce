Rails.application.routes.draw do
  root to: "jerseys#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :jerseys, only: %i[index new create edit update destroy show] do
    resources :orders, only: [:create]
  end
  get '/shop' => 'jerseys#shop'
  get '/no_results' => 'jerseys#no_results'
  resources :orders, only: %i[update destroy show index]
end
