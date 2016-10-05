class AddProduceRefToBids < ActiveRecord::Migration[5.0]
  def change
    add_reference :bids, :produce, foreign_key: true
  end
end
