class District < ApplicationRecord
	has_many :farmsites
	has_many :brokers
	has_many :bidders
end
