class Wallpost < ApplicationRecord
	belongs_to :broker
	has_many :comments
end
