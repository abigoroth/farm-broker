class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @chat_rooms = ChatRoom.all
    @inbox = current_user.chat_rooms.pluck(:user_id)
  end

  def create
    if ChatRoom.between(params[:sender_id], params[:receiver_id]).present?
      @chat_room = ChatRoom.between(params[:sender_id], params[:receiver_id]).first
    else
      @chat_room = ChatRoom.create!(chat_room_params)
    end
      redirect_to chat_room_path(@chat_room)
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    @chat_room.delete
    redirect_to chat_rooms_path
  end

  private
    def chat_room_params
      params.permit(:sender_id, :receiver_id)
    end
end
