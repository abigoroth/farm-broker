class District < ApplicationRecord

belongs_to :state

	has_many :farmsites
  belongs_to :state
  has_many :bidders
  has_many :brokers

end
