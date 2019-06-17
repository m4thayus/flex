Rails.application.routes.draw do
    resources :users
    resources :wallets, :currencies, :trades, only: [:index, :show, :new, :create]
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
end
