class Farmsite < ApplicationRecord
	belongs_to :farmer
	has_many :produces
		
	#geocoded_by :farmsiteaddress
	geocoded_by :latitude
	after_validation :geocode  #, :if => :address_changed?
	validates_presence_of :latitude, :longitude
	scope :search, -> (keyword) { where("farmsitename like ?", "#{keyword}%")}
 
end


	# belongs_to :city