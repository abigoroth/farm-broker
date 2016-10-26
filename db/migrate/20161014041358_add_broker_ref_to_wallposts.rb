class AddBrokerRefToWallposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :wallposts, :broker, foreign_key: true
  end
end
