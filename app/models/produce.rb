class Produce < ApplicationRecord
	belongs_to :farmsite

	has_many :bids
  	has_many :brokers , through: :bids

	has_attached_file :produceimage, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :produceimage, content_type: /\Aimage\/.*\z/
end
