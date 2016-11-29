class Comment < ApplicationRecord
		belongs_to :wallpost
		belongs_to :broker, class_name: 'User'

		validates_presence_of :comment_message, presence: true
end
