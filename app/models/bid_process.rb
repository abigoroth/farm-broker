class BidProcess < ApplicationRecord
	belongs_to :bid
	belongs_to :bidder

	validate :check_price, on: :create
	def check_price
		if self.price <= bid.bid_processes.maximum(:price)
			errors.add(:price,"Price must be higher!")
		end
	end
end
