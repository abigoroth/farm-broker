class Bid < ApplicationRecord
	has_many :bid_processes
	has_many :bidders, through: :bid_processes

	belongs_to :broker
	belongs_to :produce
	validate :check_maxprice, on: :create
	def check_maxprice
		
		
			if self.max_price < self.start_price 
					errors.add(:max_price,"Max Price must be higher than Start Price!")
			end
		end
end
