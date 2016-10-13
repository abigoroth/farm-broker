class Place < ApplicationRecord

	geocoded_by :farmsiteaddress
	after_validation :geocode
end
