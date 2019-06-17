Rails.application.routes.draw do
    resources :users
    resources :wallets, :currency, :trades, only: [:index, :show, :new, :create]
end
