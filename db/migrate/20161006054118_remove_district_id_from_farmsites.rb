class RemoveDistrictIdFromFarmsites < ActiveRecord::Migration[5.0]
  def change
  	remove_column :farmsites, :district_id,:integer
  end
end
