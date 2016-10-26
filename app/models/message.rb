class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  validates_presence_of :body, :chat_room_id, :user_id
  scope :for_display, -> { order(:created_at).last(50) }
  
  after_commit { MessageRelayJob.perform_later(self) }

  def message_time
    created_at.strftime("%d/%m/%Y at  %l:%M %p")
  end

  def mentions
    content.scan(/@(#{User::NAME_REGEX})/).flatten.map do |name|
      User.find_by(name: name)
    end.compact
  end
end
