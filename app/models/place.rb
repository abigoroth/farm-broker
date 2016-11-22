class Place < ApplicationRecord
	
	geocoded_by :latitude
	after_validation :geocode
end
