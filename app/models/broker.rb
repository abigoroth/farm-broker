class Broker < ApplicationRecord
  has_one :user, as: :meta, dependent: :destroy
  validates :name, presence: true

  has_many :farmsites,dependent: :destroy

  has_many :produces , through: :bids,dependent: :destroy

  has_many :produces , through: :farmsites,dependent: :destroy

  has_many :produces,dependent: :destroy

  has_many :wallposts,dependent: :destroy

  has_many :comments,dependent: :destroy


  def birth_date
    dob.strftime("%d/%m/%Y")
  end
  # has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/
end
