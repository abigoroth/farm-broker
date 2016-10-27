class Place < ApplicationRecord
	
	geocoded_by :latitude
	after_validation :geocode, :if => :address_changed?
end
