class AddUserRefToWallposts < ActiveRecord::Migration[5.0]
  def change
  	add_reference :wallposts, :user, foreign_key: true
  end
end
