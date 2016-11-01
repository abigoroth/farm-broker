class Bidder < ApplicationRecord

  has_one :user, as: :meta, dependent: :destroy
  validates :name, :dob, presence: true

  has_many :bid_processes

  has_many :bids

  # has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/

  # after_create :welcome_send
  # def welcome_send
  #   WelcomeMailer.welcome_send(self).deliver
  # end

end
