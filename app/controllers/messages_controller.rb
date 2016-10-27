class MessagesController < ApplicationController
  before_action :set_message
  def create
    @message = Message.create! body: params[:message][:body], chat_room: @chat_room, user: current_user

  end

  private
    def set_message
      @chat_room = ChatRoom.find(params[:chat_room_id])
  end
end
