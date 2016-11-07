class Farmsite < ApplicationRecord
	belongs_to :farmer
	has_many :produces, through: :farmsites
		
	#geocoded_by :farmsiteaddress
	geocoded_by :latitude
	after_validation :geocode  #, :if => :address_changed?
	validates_presence_of :latitude, :longitude
 
end


	# belongs_to :city