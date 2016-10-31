class Broker < ApplicationRecord
  has_one :user, as: :meta, dependent: :destroy
  validates :name, presence: true

  has_many :farmsites
  has_many :bids
  has_many :produces , through: :bids
  has_many :produces , through: :farmsites
  has_many :produces
  has_many :wallposts
  has_many :comments
  
  # has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/
end
