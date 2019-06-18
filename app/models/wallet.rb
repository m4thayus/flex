class Wallet < ApplicationRecord
    belongs_to :user
    belongs_to :currency
    has_many :trades
    
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
