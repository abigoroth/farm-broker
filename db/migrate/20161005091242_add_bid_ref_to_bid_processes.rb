class AddBidRefToBidProcesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :bid_processes, :bid, foreign_key: true
  end
end
