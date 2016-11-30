class RemoveBrokerIdFromWallposts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :wallposts, :broker_id, :integer
  end
end
