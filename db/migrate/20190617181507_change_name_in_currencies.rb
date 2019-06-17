class ChangeNameInCurrencies < ActiveRecord::Migration[5.2]
    def change
        change_column :currencies, :name, :string
    end
end
