class Farmsite < ApplicationRecord
	belongs_to :broker
	has_many :produces
end
