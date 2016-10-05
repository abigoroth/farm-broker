class BidProcess < ApplicationRecord
	belongs_to :bid
	belongs_to :bidder
end
