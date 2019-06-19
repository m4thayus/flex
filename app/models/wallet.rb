class Wallet < ApplicationRecord
    belongs_to :user
    belongs_to :currency
    has_many :trades, foreign_key: "offered_wallet_id", dependent: :destroy
    
    def currency_symbol
      self.currency.symbol
    end
    
    def credit(amount)
      self.amount -= amount
      self.save
    end
    
    def debit(amount)
      self.amount += amount
      self.save
    end
end
