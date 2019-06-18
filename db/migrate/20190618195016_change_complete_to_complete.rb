class ChangeCompleteToComplete < ActiveRecord::Migration[5.2]
  def change
    rename_column :trades, :complete?, :completed
  end
end
