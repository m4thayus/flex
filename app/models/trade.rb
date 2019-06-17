class Trade < ApplicationRecord
    belongs_to :wallet, foreign_key: "offered_wallet_id"
    belongs_to :wallet, foreign_key: "requested_wallet_id"
end
