class Wallpost < ApplicationRecord
  
  
  belongs_to :user
  has_many :comments

  validates_presence_of :wall_status

end
