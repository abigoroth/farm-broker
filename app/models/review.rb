class Review < ApplicationRecord
	belongs_to :farmsite
	belongs_to :user

  validates_presence_of :rating, :comment
end
