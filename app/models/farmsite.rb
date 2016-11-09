class Farmsite < ApplicationRecord
	belongs_to :farmer
	has_many :produces
		
	#geocoded_by :farmsiteaddress
	geocoded_by :latitude
	after_validation :geocode  #, :if => :address_changed?
	has_many :reviews

	validates_presence_of :latitude, :longitude, :farmsitename
	scope :search, -> (keyword) { where("farmsitename like ?", "#{keyword}%")}
	  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 
end


	# belongs_to :city