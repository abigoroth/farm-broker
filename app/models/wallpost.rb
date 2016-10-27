class Wallpost < ApplicationRecord
	belongs_to :broker, class_name: 'User'
	has_many :comments
end
