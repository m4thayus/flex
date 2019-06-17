class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.float :offered_amount
      t.integer :offered_wallet_id
      t.float :requested_amount
      t.integer :requested_wallet_id
      t.boolean :complete?

      t.timestamps
    end
  end
end
