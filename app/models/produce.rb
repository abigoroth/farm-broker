class Produce < ApplicationRecord
	belongs_to :farmsite

	has_many :bids
  	has_many :brokers , through: :bids

end
