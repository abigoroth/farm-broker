class Farmsite < ApplicationRecord
	belongs_to :user
	has_many :produces, through: :farmsites
	geocoded_by :farmsiteaddress
	after_validation :geocode
 
end


	# belongs_to :city