class AddCitiesToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :farmsitecity, :string
  end
end
