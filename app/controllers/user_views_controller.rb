class UserViewsController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end

  def remove_photo
    @user = User.find(params[:id])
    @user.profilephoto = nil
    @user.save
    redirect_to user_views_profile_path(id: @user.id), flash: { success: 'User profile photo has been removed.' }
  end
end
