class Comment < ApplicationRecord
		belongs_to :wallpost
		belongs_to :broker, class_name: 'User'
end
