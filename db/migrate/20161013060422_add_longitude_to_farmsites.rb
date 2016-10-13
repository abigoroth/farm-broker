class AddLongitudeToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :longitude, :string
  end
end
