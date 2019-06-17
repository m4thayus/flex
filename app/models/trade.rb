class Trade < ApplicationRecord
    belongs_to :wallet, foreign_key: "offered_wallet_id"
end
