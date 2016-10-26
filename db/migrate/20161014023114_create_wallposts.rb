class CreateWallposts < ActiveRecord::Migration[5.0]
  def change
    create_table :wallposts do |t|
      t.string :wall_status
      t.datetime :wall_date

      t.timestamps
    end
  end
end
