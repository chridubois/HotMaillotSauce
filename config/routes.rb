Rails.application.routes.draw do
  root to: "jerseys#index"
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources 'jerseys', only: %i[index new create edit update destroy show] do
    #test orders create: new à suppr !!!
    resources 'orders', only: %i[new create]
  end

  get '/shop' => 'jerseys#shop'

  resources 'orders', only: %i[update destroy index show]

end
