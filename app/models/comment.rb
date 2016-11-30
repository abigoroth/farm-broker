class Comment < ApplicationRecord
		belongs_to :wallpost
		belongs_to :user

		validates_presence_of :comment_message, presence: true
end
