class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

         ROLES = %w[broker bidder farmer].freeze

         validates :role, presence: true

         has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://pixabay.com/static/uploads/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png"
         validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/

         def birth_date
           dob.strftime('%d/%m/%Y')
         end

         has_many :chat_rooms, foreign_key: :sender_id
         has_many :messages
end
