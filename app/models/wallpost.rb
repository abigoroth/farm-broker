class Wallpost < ApplicationRecord
  include Bootsy::Container
  
  belongs_to :broker, class_name: 'User'
  has_many :comments

  validates_presence_of :wall_status

end
