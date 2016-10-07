class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :farmsites
  has_many :bids
  has_many :produces , through: :bids
  has_many :produces , through: :farmsites

  has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/
end
