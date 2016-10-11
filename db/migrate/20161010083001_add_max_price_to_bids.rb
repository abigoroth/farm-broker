class AddMaxPriceToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :max_price, :decimal
  end
end
