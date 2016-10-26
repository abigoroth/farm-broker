# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def follow(data)
    stop_all_streams
    stream_from "chat_rooms:#{data['chat_room_id'].to_i}:messages"
  end

  def unfollow
    stop_all_streams
  end
end
