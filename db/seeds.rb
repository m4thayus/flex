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

matt = User.create!(name: "Matt", username: "m4thayus", admin: true, password: "password")
errol = User.create!(name: "Errol", username: "erroltrades", admin: true, password: "password")
shu = User.create!(name: "Shu", username: "beastmode420", admin: false, password: "password")

bitcoin = Currency.create(name: "Bitcoin", symbol: "BTC")
dollar = Currency.create(name: "United States Dollar", symbol: "USD")
euro = Currency.create(name: "Euro", symbol: "EUR")
pound = Currency.create(name: "British Pound Sterling", symbol: "GBP")
won = Currency.create(name: "South Korean Won", symbol: "KRW")
yen = Currency.create(name: "Japanese Yen", symbol: "JPY")

bitcoin.image.attach(io: File.open("currency_images/btc-brands.svg"), filename: "btc.svg", content_type: "image/svg")
dollar.image.attach(io: File.open("currency_images/dollar-sign-solid.svg"), filename: "dollar.svg", content_type: "image/svg")
euro.image.attach(io: File.open("currency_images/euro-sign-solid.svg"), filename: "euro.svg", content_type: "image/svg")
pound.image.attach(io: File.open("currency_images/pound-sign-solid.svg"), filename: "pound.svg", content_type: "image/svg")
won.image.attach(io: File.open("currency_images/won-sign-solid.svg"), filename: "won.svg", content_type: "image/svg")
yen.image.attach(io: File.open("currency_images/yen-sign-solid.svg"), filename: "yen.svg", content_type: "image/svg")

errol_btc_wallet = Wallet.create(user_id: errol.id, currency_id: bitcoin.id, amount: 5)
matt_btc_wallet = Wallet.create(user_id: matt.id, currency_id: bitcoin.id, amount: 0)
matt_usd_wallet = Wallet.create(user_id: matt.id, currency_id: dollar.id, amount: 10000)
errol_usd_wallet = Wallet.create(user_id: errol.id, currency_id: dollar.id, amount: 0)
errol_euro_wallet = Wallet.create(user_id: errol.id, currency_id: euro.id, amount: 4000)

trade1 = Trade.create!(offered_amount: 1000, offered_wallet_id: errol_euro_wallet.id, requested_amount: 1100, requested_wallet_id: errol_usd_wallet.id, completed: false)
trade2 = Trade.create!(offered_amount: 2000, offered_wallet_id: matt_usd_wallet.id, requested_amount: 2, requested_wallet_id: matt_btc_wallet.id, completed: false)
