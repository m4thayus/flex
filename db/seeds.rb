# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Currency.destroy_all
Wallet.destroy_all
Trade.destroy_all

matt = User.create(name: "Matt", username: "m4thayus")
errol = User.create(name: "Errol", username: "erroltrades")

bitcoin = Currency.create(name: "Bitcoin", symbol: "BTC")
dollar = Currency.create(name: "United States Dollar", symbol: "USD")

errol_btc_wallet = Wallet.create(user_id: errol.id, currency_id: bitcoin.id, amount: 5)
matt_btc_wallet = Wallet.create(user_id: matt.id, currency_id: bitcoin.id, amount: 0)
matt_usd_wallet = Wallet.create(user_id: matt.id, currency_id: dollar.id, amount: 10000)
errol_usd_wallet = Wallet.create(user_id: errol.id, currency_id: dollar.id, amount: 0)


trade1 = Trade.create!(offered_amount: 2, offered_wallet_id: errol_btc_wallet.id, requested_amount: 2000, requested_wallet_id: errol_usd_wallet.id, complete?: false)

trade2 = Trade.create!(offered_amount: 2000, offered_wallet_id: matt_usd_wallet.id, requested_amount: 2, requested_wallet_id: matt_btc_wallet.id, complete?: false)
