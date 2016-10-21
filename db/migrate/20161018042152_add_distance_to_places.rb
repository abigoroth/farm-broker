class AddDistanceToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :distance, :float
  end
end
