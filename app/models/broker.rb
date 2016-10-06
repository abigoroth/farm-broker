class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  
  belongs_to :district
  has_many :farmsites
  has_many :bids
  has_many :produces , through: :bids
end
