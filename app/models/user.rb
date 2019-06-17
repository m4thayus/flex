class User < ApplicationRecord
    has_many :wallets
    has_many :currencies, through: :wallets
    has_many :trades, through: :wallets
end
