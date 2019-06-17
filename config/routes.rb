Rails.application.routes.draw do
    resources :users
    resources :wallets, :currencies, :trades, only: [:index, :show, :new, :create]
end
