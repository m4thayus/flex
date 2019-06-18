class Wallet < ApplicationRecord
    belongs_to :user
    belongs_to :currency
    has_many :trades
    
    def currency_symbol
      self.currency.symbol
    end
end
