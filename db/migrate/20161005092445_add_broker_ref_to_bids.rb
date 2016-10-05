class AddBrokerRefToBids < ActiveRecord::Migration[5.0]
  def change
    add_reference :bids, :broker, foreign_key: true
  end
end
