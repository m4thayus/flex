class Trade < ApplicationRecord
    belongs_to :offered_wallet, class_name: "Wallet", foreign_key: "offered_wallet_id"
    belongs_to :requested_wallet, class_name: "Wallet", foreign_key: "requested_wallet_id"
    
    def offered_currency
      self.offered_wallet.currency
    end
    
    def requested_currency
      self.requested_wallet.currency
    end
end
