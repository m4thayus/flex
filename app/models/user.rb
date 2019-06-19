class User < ApplicationRecord
    has_many :wallets, dependent: :destroy
    has_many :currencies, through: :wallets
    has_many :trades, through: :wallets
    has_secure_password
    validates :username, uniqueness: true
end
