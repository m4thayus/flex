class Currency < ApplicationRecord
    has_many :wallets
    has_many :trades, through: :wallets
    has_many :users, through: :wallets
    has_one_attached :image
end
