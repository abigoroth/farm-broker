class AddFarmerIdToBids < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :farmer_id, :integer
  end
end
