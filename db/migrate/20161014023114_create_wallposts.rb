class CreateWallposts < ActiveRecord::Migration[5.0]
  def change
    create_table :wallposts do |t|
      t.text :wall_status
      t.datetime :wall_date
      t.integer :broker_id
      t.timestamps
    end
  end
end
