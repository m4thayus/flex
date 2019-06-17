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

matt = User.create(name: "Matt")
errol = User.create(name: "Errol")

bitcoin = Currency.create(name: "Bitcoin", symbol: "BTC")
dollar = Currency.create(name: "United States Dollar", symbol: "USD")

errol_wallet = Wallet.create(user_id: errol.id, currency_id: bitcoin.id, amount: 5)
matt_wallet = Wallet.create(user_id: matt.id, currency_id: dollar.id, amount: 10000)
