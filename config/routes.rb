Rails.application.routes.draw do
    resources :currencies
    resources :users, except: :index
    resources :wallets, except: [:edit, :update]
    resources :trades, except: [:show, :edit, :update] 
    get "/login", to: "sessions#new", as: "login"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
end
