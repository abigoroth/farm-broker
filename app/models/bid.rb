class Bid < ApplicationRecord
	has_many :bid_processes
	has_many :bidders, through: :bid_processes

	belongs_to :farmer
	belongs_to :produce
	validate :check_max_price, on: :create
	validate :check_end_time, on: :create

	def check_max_price
		if self.max_price <= self.start_price
			errors.add(:max_price,"Last Price must be higher than Start Price!")
		end
	end

	def check_end_time
		if self.end_time <= self.start_time
			errors.add(:end_time,"End Time must be more than Start Time!")
		end
	end

end