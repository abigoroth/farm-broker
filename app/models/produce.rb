class Produce < ApplicationRecord
	belongs_to :farmsite
	belongs_to :farmer
	has_many :bids
  	has_many :brokers , through: :bids
  	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing1.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


end
