class AddDescriptionToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :farmsitedescription, :string
  end
end
