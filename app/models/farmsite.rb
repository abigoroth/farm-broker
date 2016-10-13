class Farmsite < ApplicationRecord
	belongs_to :broker
	has_many :produces, through: :farmsites
end


	# belongs_to :city