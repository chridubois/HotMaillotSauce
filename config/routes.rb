Rails.application.routes.draw do
  root to: "jerseys#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources 'jerseys', only: %i[index new create edit update destroy show]
  get '/shop' => 'jerseys#shop'
  resources 'orders', only: %i[create update destroy show index]
end
