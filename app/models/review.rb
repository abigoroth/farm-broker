class Review < ApplicationRecord

	belongs_to :farmsite
	belongs_to :user
end
