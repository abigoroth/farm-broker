class Wallpost < ApplicationRecord
  include Bootsy::Container
  validates :wall_status, presence: true
  belongs_to :broker, class_name: 'User'
  has_many :comments

end
