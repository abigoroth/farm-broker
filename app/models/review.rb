class Review < ApplicationRecord
	belongs_to :farmsite
	belongs_to :user

  validates_presence_of :rating, :comment

  validates :user_id, :uniqueness => { :scope => :farmsite_id,
    :message => "Users may only write one review per product." }
end
