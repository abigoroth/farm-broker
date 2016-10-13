class AddLatitudeToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :latitude, :string
  end
end
