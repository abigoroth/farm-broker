class FriendshipsController < ApplicationController

  def index
    @users = User.all
    @friends= current_user.friendships.pluck(:friend_id)
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
   if @friendship.save
     flash[:notice] = "Added friend."
     redirect_to friendships_path
   else
     flash[:error] = "Unable to add friend."
     redirect_to friendships_path
   end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend."
    redirect_to friendships_path
  end

  def show
  end

  private
  def friendship_params
    params.permit(:user_id, :friend_id)
  end
end
