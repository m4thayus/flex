Rails.application.routes.draw do
    resources :currencies
    resources :users, except: :index
    resources :wallets, :trades, except: [:edit, :update]
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
end
