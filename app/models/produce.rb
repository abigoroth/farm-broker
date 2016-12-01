class Produce < ApplicationRecord
	belongs_to :farmsite
	belongs_to :farmer
	has_many :bids
	has_many :brokers , through: :bids
	has_attached_file :avatar, styles: { large: "400x400>",medium: "300x300>", thumb: "100x100>" }, default_url: "missing1.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates_presence_of :producename, :producequantity

	scope :search, -> (keyword) { where("producename like ?", "%#{keyword}%") }


	scope :search_state, -> (state) {joins(:farmsite)
	.where("farmsites.farmsitestate = '#{state}'") if state.presence
	}
	scope :search_city, -> (city) {joins(:farmsite)
	.where("farmsites.farmsitecity = '#{city}'") if city.presence && city != "null"
	}
end
