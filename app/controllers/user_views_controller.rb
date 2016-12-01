class UserViewsController < ApplicationController
 before_action :check_meta , if: "user_signed_in?",except: :meta
  def profile
    if user_signed_in?
      @user = User.find(params[:id])
      @friends= Friendship.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 3)
      @inbox = current_user.chat_rooms.pluck(@user.id)
      @chat_rooms = ChatRoom.all
      @wallposts = Wallpost.where(user_id: @user.id).order('created_at DESC')
    else
      @user = User.find(params[:id])
      @wallposts = Wallpost.where(user_id: @user.id).order('created_at DESC')
    end
  end

  def create
    @wallpost = Wallpost.create! wall_status: params[:wallpost][:wall_status], user: current_user
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
