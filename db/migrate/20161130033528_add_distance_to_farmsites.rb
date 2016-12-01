class AddDistanceToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :distance, :float
  end
end
