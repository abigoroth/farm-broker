class Farmsite < ApplicationRecord
	belongs_to :district
	belongs_to :broker
	has_many :produces
end
