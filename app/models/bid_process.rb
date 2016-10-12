class BidProcess < ApplicationRecord
	belongs_to :bid
	belongs_to :bidder

	validate :check_price, on: :create
	def check_price
		if self.price > bid.max_price or self.price <= bid.start_price or (bid.bid_processes.present? and  self.price <= bid.bid_processes.maximum(:price) )
			errors.add(:price,"Price must be higher than Start Price / lower than Last Price!")
		end
	end
end