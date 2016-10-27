class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_rooms:#{message.chat_room_id}:messages",
      message: MessagesController.render(partial: 'messages/message', locals: { message: message })
  end
end
