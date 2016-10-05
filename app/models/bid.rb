class Bid < ApplicationRecord
	has_many :bid_processes
	has_many :bidders, through: :bid_processes
end
