class ChangeBrokerIdToFarmerId < ActiveRecord::Migration[5.0]
  def change
  	rename_column :produces, :broker_id, :farmer_id
  end
end
