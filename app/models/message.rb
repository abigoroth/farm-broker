class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates_presence_of :body, :chat_room_id, :user_id

  after_commit { MessageRelayJob.perform_later(self) }

  def message_time
    created_at.strftime("%d/%m/%Y at  %l:%M %p")
  end
end
