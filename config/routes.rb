Rails.application.routes.draw do
  get 'trades/index'
  get 'trades/show'
  get 'trades/new'
  get 'currencies/index'
  get 'currencies/new'
  get 'currencies/show'
  get 'wallets/new'
  get 'wallets/show'
  get 'currency/index'
  get 'currency/new'
  get 'users/new'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
