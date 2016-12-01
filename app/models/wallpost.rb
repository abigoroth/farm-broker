class Wallpost < ApplicationRecord
  
  include Bootsy::Container
  belongs_to :user
  has_many :comments

  validates_presence_of :wall_status

end
