class AddStatesToFarmsites < ActiveRecord::Migration[5.0]
  def change
    add_column :farmsites, :farmsitestate, :string
  end
end
