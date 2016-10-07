class AddBidderRefToBids < ActiveRecord::Migration[5.0]
  def change
  	add_reference :bids, :bidder, foreign_key: true
  end
end
