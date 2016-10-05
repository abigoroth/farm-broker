class AddBidderRefToBidProcesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :bid_processes, :bidder, foreign_key: true
  end
end
