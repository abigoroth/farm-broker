class User < ApplicationRecord
  
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,:confirmable,
    :recoverable, :rememberable, :trackable, :validatable
    belongs_to :meta, polymorphic: true, required: false
    accepts_nested_attributes_for :meta
    #role
    #enum role: [:broker, :bidder, :farmer]
    #ROLES = %w[broker bidder farmer].freeze
    #validates :role, presence: true
    #photo upload
    has_attached_file :profilephoto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/Blank-Profile.jpg"
    validates_attachment_content_type :profilephoto, content_type: /\Aimage\/.*\z/
    #birth date format
    def birth_date
        dob.strftime('%d/%m/%Y')
    end
    #Messages
    has_many :chat_rooms, foreign_key: :sender_id,dependent: :destroy
    has_many :messages,dependent: :destroy
    #Friends
    has_many :friendships,dependent: :destroy
    has_many :friends, :through => :friendships,dependent: :destroy
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id",dependent: :destroy
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user,dependent: :destroy

    
    #Wallpost
    has_many :wallposts,dependent: :destroy
    #Farmsite
    has_many :farmsites,dependent: :destroy
    #Comment
    has_many :comments, foreign_key: :broker_id,dependent: :destroy
    #Review
    has_many :reviews,dependent: :destroy

        
    #  #broker
    #      has_many :farmsites
    #      has_many :bids
    #      has_many :produces , through: :bids
    #      has_many :produces , through: :farmsites
    #      has_many :produces
    #      has_many :wallposts
    #      has_many :comments


    # #bidder
    # has_many :bid_processes
    # has_many :bids
    # has_many :bids, foreign_key: :farmer_id,dependent: :destroy


end
