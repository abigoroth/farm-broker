class Farmsite < ApplicationRecord
	belongs_to :farmer
	has_many :produces
	has_many :reviews
	
	#geocoded_by :farmsiteaddress
	geocoded_by :latitude
	after_validation :geocode  #, :if => :address_changed?
	has_many :reviews

	validates_presence_of :latitude, :longitude, :farmsitename
	
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	scope :search, -> (keyword) { where("farmsitename like ?", "%#{keyword}%")}
	scope :search_state, -> (state) { where("farmsitestate like ?", "#{state}%") if state.presence }
	scope :search_city, -> (city) { where("farmsitecity like ?", "#{city}%") if city.presence && city != "null" }

end


	# belongs_to :city