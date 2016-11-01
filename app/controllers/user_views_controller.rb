class UserViewsController < ApplicationController
 before_action :check_meta , if: "user_signed_in?",except: :meta
  def profile
    @user = User.find(params[:id])
    @inbox = current_user.chat_rooms.pluck(@user.id)
    @chat_rooms = ChatRoom.all
    @wallposts = Wallpost.where(broker_id: @user.id).order('created_at DESC')
  end

  def create
    @wallpost = Wallpost.create! wall_status: params[:wallpost][:wall_status], broker: current_user
    flash[:notice] = 'Post created'
    redirect_to user_views_profile_path(id: current_user.id)
  end

  def remove_photo
    @user = User.find(params[:id])
    @user.profilephoto = nil
    @user.save
    redirect_to user_views_profile_path(id: @user.id), flash: { success: 'User profile photo has been removed.' }
  end

  def index
    @users = User.all
  end
  
  def show
    @user = current_user
  end

  private
  def wallpost_params
    params.permit(:wall_status)
  end
end
